import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  //bool _isSignedUp = false;

  bool _obscurePassword = true;
  // TODO: 1. Membuat fungsi _signUp
  void _signup() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String name = _nameController.text.trim();
    final String username = _usernameController.text.trim();
    final String email = _emailController.text.trim();
    final int no_telpon = _nomorController.text.trim() as int;
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

    //simpan data pengguna di SgaredPreferences
    prefs.setString('fullname', name);
    prefs.setString('username', username);
    prefs.setString('email', email );
    prefs.setInt('no_telpon', no_telpon);
    prefs.setString('password', password);

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

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up"),),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'FORM SIGNUP',
                      style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontSize: 30
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: "Nama Depan",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: "Nama Belakang",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: "Email Pengguna",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _nomorController,
                    decoration: InputDecoration(
                      labelText: "Nomor Telepon Pengguna",
                      errorText: _errorText.isNotEmpty ? _errorText : null,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Kata Sandi",
                      errorText: _errorText.isNotEmpty ? _errorText : null,
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off
                              : Icons.visibility,
                        ),),
                    ),
                    obscureText: _obscurePassword,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: (){
                        _signup();
                      },
                      child: Text('Sign Up')),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: 'Sudah mempunyai Akun?',
                      style: const TextStyle(fontSize: 16,color: Colors.deepOrangeAccent),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Login disini!',
                          style: const TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              fontSize: 16
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}