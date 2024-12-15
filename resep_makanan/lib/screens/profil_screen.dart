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

<<<<<<< Updated upstream
=======
  // TODO 5. Implementasi fungsi signIn
  void signIn() {
    // setState(() {
    // isSignedIn = !isSignedIn;
    //});
>>>>>>> Stashed changes


  @override
  void initState() {
    super.initState();
    _loadUserData(); // Panggil fungsi untuk memuat data pengguna
  }

<<<<<<< Updated upstream
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
=======
  // TODO 6. Implementasi fungsi signOut
  // Fungsi untuk sign out
  void signOut() async {
    // Menghapus data login dari SharedPreferences (jika ada)
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    setState(() {
      isSignedIn = false; // Ubah status login
      fullName = ''; // Reset data pengguna
      userName = '';
      email = '';
      phone = '';
      favorite = 0;
>>>>>>> Stashed changes
    });

  }

  // Fungsi untuk logout
  Future<void> signOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSignedIn', false);  // Set status login menjadi false saat logout


    Navigator.pushReplacementNamed(context, '/signin');  // Navigasikan ke SignIn screen setelah logout
  }

  // Menampilkan dialog konfirmasi sign out
  void showSignOutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Logout'),
          content: Text('Apakah Anda yakin ingin logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog tanpa aksi
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                signOut(); // Jalankan fungsi signOut
              },
              child: Text('Logout'),
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
<<<<<<< Updated upstream
              ),
=======
                //TODO: 3. Buat bagian ProfileInfo yang berisi info profil
                // Nama Lengkap
                SizedBox(height: 4),
                Divider(color: Colors.deepOrangeAccent[100]),
                SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        children: [
                          Icon(Icons.person, color: Colors.amber),
                          SizedBox(width: 8),
                          Text('Nama Lengkap',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ': $fullName',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    if (isSignedIn) Icon(Icons.edit),
                  ],
                ),
                // Username
                SizedBox(height: 4),
                Divider(color: Colors.deepOrangeAccent[100]),
                SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        children: [
                          Icon(Icons.person, color: Colors.amber),
                          SizedBox(width: 8),
                          Text('Username',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ': $userName',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    if (isSignedIn) Icon(Icons.edit),
                  ],
                ),

                // Baris Email Pengguna
                SizedBox(height: 4),
                Divider(color: Colors.deepOrangeAccent[100]),
                SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        children: [
                          Icon(Icons.email, color: Colors.blue),
                          SizedBox(width: 8),
                          Text('Email Pengguna',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ': $email',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    if (isSignedIn) Icon(Icons.edit),
                  ],
                ),

                // Baris Nomor Telpon
                SizedBox(height: 4),
                Divider(color: Colors.deepOrangeAccent[100]),
                SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        children: [
                          Icon(Icons.call, color: Colors.blue),
                          SizedBox(width: 8),
                          Text('No Telpon',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ': $phone',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    if (isSignedIn) Icon(Icons.edit),
                  ],
                ),
                // Baris Favorit
                SizedBox(height: 4),
                Divider(color: Colors.deepOrangeAccent[100]),
                SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Favorit',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ': $favorite',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    if (isSignedIn) Icon(Icons.edit),
                  ],
                ),

                //TODO: 4. Buat ProfileActions yang berisi TextButton sign in/out
                SizedBox(height: 4),
                Divider(color: Colors.deepOrangeAccent[100]),
                SizedBox(height: 20),
                isSignedIn
                    ? TextButton(onPressed: signOut, child: Text('Sign Out'))
                    : TextButton(onPressed: signIn, child: Text('Sign In')),
              ],
>>>>>>> Stashed changes
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

