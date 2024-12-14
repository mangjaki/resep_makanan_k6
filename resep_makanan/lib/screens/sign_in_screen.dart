import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // TODO: 1. Deklarasi Variable
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  String _errorText = '';

  bool _isSignedIn = false;

  bool _obscurePassword = true;

  Future<Map<String, String>> _retrieveAndDecryptDataFromPrefs(SharedPreferences prefs) async {
    final encryptedUsername = prefs.getString('username') ?? '';
    final encryptedPassword = prefs.getString('password') ?? '';
    final keyString = prefs.getString('key') ?? '';
    final ivString = prefs.getString('iv') ?? '';

    if (keyString.isEmpty || ivString.isEmpty || encryptedUsername.isEmpty || encryptedPassword.isEmpty) {
      return {};
    }

    final encrypt.Key key = encrypt.Key.fromBase64(keyString);
    final iv = encrypt.IV.fromBase64(ivString);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final decryptedUsername = encrypter.decrypt64(encryptedUsername, iv: iv);
    final decryptedPassword = encrypter.decrypt64(encryptedPassword, iv: iv);

    // Mengembalikan data terdekripsi
    return {'username': decryptedUsername, 'password': decryptedPassword};
  }

  void _signIn() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String username = _usernameController.text;
      final String password = _passwordController.text;

      print('Sign in attempt');
      if (username.isNotEmpty && password.isNotEmpty) {
        final data = await _retrieveAndDecryptDataFromPrefs(prefs);
        if (data.isNotEmpty) {
          final decryptedUsername = data['username'];
          final decryptedPassword = data['password'];
          if (username == decryptedUsername && password == decryptedPassword) {
            setState(() {
              _errorText = '';
              _isSignedIn = true;
            });
            prefs.setBool('isSignedIn', true);

            // Navigasi ke halaman utama
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, '/home');
            });
            print('Sign in succeeded');
          } else {
            setState(() {
              _errorText = 'Username atau password salah';
            });
            print('Username or password is incorrect');
          }
        } else {
          setState(() {
            _errorText = 'Data kredensial tidak ditemukan';
          });
          print('No stored credentials found');
        }
      } else {
        setState(() {
          _errorText = 'Username dan password tidak boleh kosong';
        });
        print('Username and password cannot be empty');
      }
    } catch (e) {
      setState(() {
        _errorText = 'Terjadi kesalahan: $e';
      });
      print('An error occurred: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700], // Warna latar belakang
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: 300,
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[300],
                      child: Icon(
                        Icons.restaurant_menu,
                        color: Colors.grey[600],
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "SIGN IN",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: "Username",
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.account_box),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "Masukan Password",
                        errorText: _errorText.isNotEmpty ? _errorText : null,
                        border: const OutlineInputBorder(),
                        icon: Icon(Icons.password),
                        suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      obscureText: _obscurePassword,
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                        onPressed: (){
                          _signIn();
                        },
                        child:const Text('Login')),
                    const SizedBox(height: 10),
                    RichText(
                        text: TextSpan(
                            text: 'Belum Memiliki Akun ? ',
                            style:
                            const TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Daftar Sekarang !',
                                style: const TextStyle(
                                    color: Colors.deepPurple,
                                    decoration: TextDecoration.underline,
                                    fontSize: 12
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, '/signup');
                                  },
                              )
                            ]
                        )
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}