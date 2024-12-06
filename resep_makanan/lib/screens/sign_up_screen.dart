import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:resep_makanan/screens/profil_screen.dart';

class SignUpScreen extends StatefulWidget {
  //StatefulWidget: Digunakan untuk membuat halaman yang membutuhkan perubahan status, seperti mengelola input teks pengguna.
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();




  String _errorText = '';

  //bool _isSignedUp = false;

  bool _obscurePassword = true;
  // TODO: 1. Membuat fungsi _signUp
  void _signup() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String firstName = _firstNameController.text.trim();
    final String lastName = _lastNameController.text.trim();
    final String userName = _userNameController.text.trim();
    final String email = _emailController.text.trim();
    final int phone = _phoneController.text.trim() as int;
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

    // // Validasi Pada Fungsi _signup
    // if (firstName.isEmpty ||
    //     lastName.isEmpty ||
    //     userName.isEmpty ||
    //     email.isEmpty ||
    //     phone.isEmpty||
    //     password.isEmpty) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Harap isi semua field!')),
    //   );
    //   return;
    // }

    //simpan data pengguna di SgaredPreferences
    prefs.setString('firstName', firstName);
    prefs.setString('lstName', lastName);
    prefs.setString('userName', userName);
    prefs.setString('email', email );
    prefs.setInt('phone', phone);
    prefs.setString('password', password);

    //buat navigasi ke signScreen
    Navigator.pushReplacementNamed(context, '/signin');
  }
  // TODO: 2. Membuat Fungsi dispose
  @override
  void dispose() {
    //TODO: IMPLEMENTASI DISPOSE
    _firstNameController.dispose();
    _lastNameController.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
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
                    controller: _firstNameController,
                    decoration: const InputDecoration(
                      labelText: "Nama Depan",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(
                      labelText: "Nama Belakang",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _userNameController,
                    decoration: const InputDecoration(
                      labelText: "Nama Pengguna",
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
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: "No Telepon",
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

extension on int {
  Type get isEmpty => int;
}