import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' show File;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _imageFile = '';
  final picker = ImagePicker();
  bool isSignedIn = false;
  String fullName = '';
  String userName = '';
  String email = '';
  String phone = '';
  int favorite = 0;

  @override
  void initState() {
    super.initState();
    _loadImage();
    _loadUserData();
  }

  Future<void> _saveImage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('imagePath', _imageFile);
  }

  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _imageFile = prefs.getString('imagePath') ?? '';
    });
  }

  Future<void> _getImage(ImageSource source) async {
    try {
      if (kIsWeb && source == ImageSource.camera) {
        // Fallback for web when using camera
        debugPrint("Camera is not supported on web.");
        return;
      }
      final pickedFile = await picker.pickImage(
        source: source,
        maxHeight: 720,
        maxWidth: 720,
        imageQuality: 80,
      );
      if (pickedFile != null) {
        setState(() {
          _imageFile = pickedFile.path;
        });
        _saveImage();
      } else {
        debugPrint('No image selected!');
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  void _showPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.white,
            child: Wrap(
              children: [
                ListTile(
                  leading: const Icon(Icons.camera, color: Colors.indigo),
                  title: const Text('Camera'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _getImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library, color: Colors.indigo),
                  title: const Text('Gallery'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _getImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          );
        });
  }

  Future<void> _loadUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('name') ?? 'Unknown';
      userName = prefs.getString('username') ?? 'Unknown';
      email = prefs.getString('email') ?? 'Unknown';
      phone = prefs.getString('notelpon') ?? 'Unknown';
      favorite = prefs.getInt('favorite_count') ?? 0;
      isSignedIn = prefs.getBool('isSignedIn') ?? false;
    });
  }

  Future<void> _saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', fullName);
    prefs.setString('username', userName);
    prefs.setString('email', email);
    prefs.setString('notelpon', phone);
  }

  Future<void> signOut() async {
    await _saveData(); // Simpan data terakhir
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSignedIn', false);
    Navigator.pushReplacementNamed(context, '/signin');
  }

  void _editData(String label, String currentValue, Function(String) onSave) {
    TextEditingController controller = TextEditingController(text: currentValue);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $label'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onSave(controller.text);
                _saveData(); // Simpan data ke SharedPreferences
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.indigo[100],
                    backgroundImage: _imageFile.isNotEmpty
                        ? (kIsWeb
                        ? NetworkImage(_imageFile)
                        : FileImage(File(_imageFile))) as ImageProvider
                        : const AssetImage('assets/images/avatars.jpg') as ImageProvider,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt, color: Colors.indigo),
                      onPressed: _showPicker,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Profile Info Cards
              _buildProfileInfoCard('Nama Lengkap', fullName, Icons.person, (newValue) {
                setState(() {
                  fullName = newValue;
                });
              }),
              _buildProfileInfoCard('Username', userName, Icons.account_circle, (newValue) {
                setState(() {
                  userName = newValue;
                });
              }),
              _buildProfileInfoCard('Email', email, Icons.email, (newValue) {
                setState(() {
                  email = newValue;
                });
              }),
              _buildProfileInfoCard('No Handphone', phone, Icons.phone, (newValue) {
                setState(() {
                  phone = newValue;
                });
              }),
              _buildProfileInfoCard('Favorite', favorite.toString(), Icons.favorite, null),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfoCard(String label, String value, IconData icon, Function(String)? onEdit) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.indigo),
        title: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(value, style: const TextStyle(fontSize: 14)),
        trailing: onEdit != null
            ? IconButton(
          icon: const Icon(Icons.edit, color: Colors.indigo),
          onPressed: () {
            _editData(label, value, onEdit);
          },
        )
            : null,
      ),
    );
  }
}
