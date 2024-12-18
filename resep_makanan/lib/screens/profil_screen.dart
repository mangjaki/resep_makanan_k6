import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:resep_makanan/screens/sign_in_screen.dart';
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
    if (kIsWeb && source == ImageSource.camera) {
      debugPrint('Kamera tidak didukung di Web. Gunakan perangkat fisik.');
      return;
    }

    try {
      final pickedFile = await picker.pickImage(
          source: source,
          maxHeight: 720,
          maxWidth: 720,
          imageQuality: 80
      );
      if (pickedFile != null) {
        setState(() {
          _imageFile = pickedFile.path;
        });
        _saveImage();
      } else {
        debugPrint('No image selected.');
      }
    } catch (e) {

    }
  }

  void _showPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.indigo[50],
            child: Wrap(
              children: [
                ListTile(
                  leading: const Icon(
                      Icons.camera,
                      color: Colors.indigo
                  ),
                  title: const Text('Camera'),
                  onTap: (){
                    debugPrint('Kamera dipanggil');
                    Navigator.of(context).pop();
                    _getImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: const Icon(
                      Icons.photo_library,
                      color: Colors.indigo
                  ),
                  title: const Text('Gallery'),
                  onTap: (){
                    Navigator.of(context).pop();
                    _getImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          );
        }
    );
  }
  Future<void> _loadUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('name') ?? 'Tidak Diketahui';
      userName = prefs.getString('username') ?? 'Tidak Diketahui';
      email = prefs.getString('email') ?? 'Tidak Diketahui';
      phone = prefs.getString('notelpon') ?? 'Tidak Diketahui';
      favorite = prefs.getInt('favorite') ?? 0;
      isSignedIn = prefs.getBool('isSignedIn') ?? false;
    });
  }

  Future<void> _logout() async {
    Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => ProfileScreen()),
    );
  }


  @override
  void initState(){
    super.initState();
    _loadImage();
    _loadUserData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Profil',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
          children: [
      SingleChildScrollView(
      child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
          children: [
      Container(
      decoration: BoxDecoration(
      border: Border.all(color: Colors.indigo, width: 2),
      shape: BoxShape.circle,
    ),
    child: CircleAvatar(
    radius: 50,
    backgroundImage: _imageFile.isNotEmpty
    ? (kIsWeb
    ? NetworkImage(_imageFile)
        : FileImage(File(_imageFile))) as ImageProvider
        : AssetImage('assets/images/person.png'),
    ),
    ),

            const SizedBox(height: 10),
            IconButton(
              onPressed: _showPicker,
              icon: Icon(Icons.camera_alt),
              color: Colors.indigo,
              iconSize: 30,
            ),
            const SizedBox(height: 20),
            _buildProfileInfoRow('Nama Lengkap', fullName, Icons.person),
            _buildProfileInfoRow('Username', userName, Icons.account_circle),
            _buildProfileInfoRow('Email', email, Icons.email),
            _buildProfileInfoRow('No Telpon', phone, Icons.phone),
            _buildProfileInfoRow('Favorit', favorite.toString(), Icons.favorite),

            const SizedBox(height: 20)
            //
            // Center(
            //   child: TextButton(
            //     onPressed: isSignedIn ? signOut : signOut,
            //     style: TextButton.styleFrom(
            //       backgroundColor: isSignedIn ? Colors.redAccent : Colors.blueAccent,
            //       foregroundColor: Colors.white,
            //     ),
            //     child: Text(isSignedIn ? 'Log Out' : 'Log In'),
            //   ),
            // ),
          ],
        ),
      ),
    ),
    ],
    ),
    );
  }

  Widget _buildProfileInfoRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: [
          Icon(icon, color: Colors.deepOrangeAccent),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '$label: $value',
              style: const TextStyle(fontSize: 18),
            ),
          ),
            ],
          ),
    );
}
}

