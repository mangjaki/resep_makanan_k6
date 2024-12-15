import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Variabel untuk menyimpan data pengguna
  bool isSignedIn = false;
  String fullName = '';
  String userName = '';
  String email = '';
  String phone = '';
  int favorite = 0;



  @override
  void initState() {
    super.initState();
    _loadUserData(); // Panggil fungsi untuk memuat data pengguna
  }

  // Fungsi untuk memuat data pengguna dari SharedPreferences
  Future<void> _loadUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // Ambil data dari SharedPreferences
      fullName = prefs.getString('name') ?? 'Tidak Diketahui';
      userName = prefs.getString('username') ?? 'Tidak Diketahui';
      email = prefs.getString('email') ?? 'Tidak Diketahui';
      phone = prefs.getString('notelpon') ?? 'Tidak Diketahui';
      favorite = prefs.getInt('favorite') ?? 0;
      isSignedIn = prefs.getBool('isSignedIn') ?? false; //Cek Status Log In
    });

  }

  // Fungsi untuk logout
  Future<void> signOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSignedIn', false);  // Set status login menjadi false saat logout


    Navigator.pushReplacementNamed(context, '/signin');  // Navigasikan ke SignIn screen setelah logout
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header dengan gambar profil
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.deepOrangeAccent,
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: const AssetImage('images/avatar.jpg'),
                  backgroundColor: Colors.white,
                  child: isSignedIn
                      ? null
                      : const Icon(Icons.person, size: 50, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Informasi profil
            _buildProfileInfoRow('Nama Lengkap', fullName, Icons.person),
            _buildProfileInfoRow('Username', userName, Icons.account_circle),
            _buildProfileInfoRow('Email', email, Icons.email),
            _buildProfileInfoRow('No Telpon', phone, Icons.phone),
            _buildProfileInfoRow('Favorit', favorite.toString(), Icons.favorite),

            const SizedBox(height: 20),

            // Tombol Log In atau Log Out
            Center(
              child: TextButton(
                onPressed: isSignedIn ? signOut : signOut,
                style: TextButton.styleFrom(
                  backgroundColor: isSignedIn ? Colors.redAccent : Colors.blueAccent,
                  foregroundColor: Colors.white,
                ),
                child: Text(isSignedIn ? 'Log Out' : 'Log In'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk baris informasi profil
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

