import 'package:flutter/material.dart';
import 'package:resep_makanan/screens/sign_up_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO: 1.Deklarasikan variabel yang dibutuhkan
  bool isSignedIn = false;
  String fullName = '';
  String userName = '';
  String email = '';
  String phone = '';
  int favorite = 0;

  // TODO 5. Implementasi fungsi signIn
  void signIn() {

    Navigator.pushNamed(context, '/SignInScreen');
  }

  // TODO 6. Implementasi fungsi signOut
  void signOut() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepOrangeAccent,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                //TODO: 2. Buat bagian ProfileHeader yang berisi gambar profil
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200 - 50),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.deepOrangeAccent, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('images/avatar.jpg'),
                          ),
                        ),
                        if (isSignedIn)
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.camera_alt,
                                  color: Colors.deepOrangeAccent[50]))
                      ],
                    ),
                  ),
                ),
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
                Divider(color: Colors.deepPurple[100]),
                SizedBox(height: 20),
                isSignedIn
                    ? TextButton(onPressed: signOut, child: Text('Sign Out'))
                    : TextButton(onPressed: signIn, child: Text('Sign In')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
