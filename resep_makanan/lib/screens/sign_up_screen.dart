import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _nomorController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';

  bool _obscurePassword = true;

  // TODO: 1. Membuat fungsi _signUp
  void _signup() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String name = _nameController.text.trim();
    final String username = _usernameController.text.trim();
    final String email = _emailController.text.trim();
    final String notelpon = _nomorController.text.trim();
    final String password = _passwordController.text.trim();

    if (password.length < 8 ||
        !password.contains(RegExp(r'[A-Z]')) ||
        !password.contains(RegExp(r'[a-z]')) ||
        !password.contains(RegExp(r'[0-9]')) ||
        !password.contains(RegExp(r'[!@#%^&*()-_=+{}]'))) {
      setState(() {
        _errorText = 'Minimal 8 karakter, kombinasi [A-Z], [a-z],[0-9],[!@#%^&*()-_=+{}]';
      });
      return;
    }

    if(name.isNotEmpty && username.isNotEmpty && password.isNotEmpty){
      final encrypt.Key key = encrypt.Key.fromLength(32);
      final iv = encrypt.IV.fromLength(16);
      final encrypter = encrypt.Encrypter(encrypt.AES(key));
      final encryptedName = encrypter.encrypt(name, iv: iv);
      final encryptedUsername = encrypter.encrypt(username, iv: iv);
      final encryptedPassword = encrypter.encrypt(password, iv: iv);

      //simpan data pengguna di SharedPreferences
      prefs.setString('name', encryptedName.base64);
      prefs.setString('username', encryptedUsername.base64);
      prefs.setString('notelpon', encryptedPassword.base64);
      prefs.setString('password', encryptedPassword.base64);
      prefs.setString('key', key.base64);
      prefs.setString('iv', iv.base64);
    }
    //buat navigasi ke signScreen
    Navigator.pushReplacementNamed(context, '/signin');
  }

  // TODO: 2. Membuat Fungsi dispose

  @override
  void dispose() {
    //TODO: IMPLEMENTASI DISPOSE
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _nomorController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.deepOrangeAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RichText(
                          text: const TextSpan(
                            text: 'SIGN UP',
                            style: TextStyle(
                              color: Colors.deepOrangeAccent,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                              labelText: 'Nama Lengkap',
                              border: OutlineInputBorder(),
                              icon: Icon(Icons.person)
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                              labelText: 'Username',
                              border: OutlineInputBorder(),
                              icon: Icon(Icons.account_box)
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                              icon: Icon(Icons.email)
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _nomorController,
                          decoration: const InputDecoration(
                              labelText: 'No Telpon',
                              border: OutlineInputBorder(),
                              icon: Icon(Icons.phone)
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            errorText: _errorText.isNotEmpty ? _errorText : null,
                            border: const OutlineInputBorder(),
                            icon: const Icon(Icons.password),
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                              icon: Icon(
                                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                              ),
                            ),
                          ),
                          obscureText: _obscurePassword,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: (){
                            _signup();
                          },
                          child: Text('DAFTAR'),
                        ),
                        SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            text: 'Sudah Memiliki Akun?',
                            style: TextStyle(
                              fontSize: 16,color: Colors.grey
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Login disini!',
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  decoration: TextDecoration.underline,
                                  fontSize: 16
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap =(){
                                  Navigator.pushNamed(context, '/signin');
                                  },
                              ),
                            ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
