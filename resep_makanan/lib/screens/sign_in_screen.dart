import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void _signIn() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String savedUsername = prefs.getString('username') ?? '';
    final String savedPassword = prefs.getString('password') ?? '';
    final String enteredUsername = _usernameController.text.trim();
    final String enteredPassword = _passwordController.text.trim();

    if(enteredUsername.isEmpty || enteredPassword.isEmpty){
      setState(() {
        _errorText = 'Username dan Password Wajib diisi!';
      });
      return;
    }

    if(savedUsername.isEmpty || savedPassword.isEmpty){
      setState(() {
        _errorText = 'Pengguna belum terdaftar. Silakan daftar terlebih dahulu!';
      });
      return;
    }

    if (enteredUsername == savedUsername && enteredPassword == savedPassword){
      setState(() {
        _errorText = '';
        _isSignedIn = true;
        prefs
        .setBool('isSignedIn', true);
      });
      WidgetsBinding.instance.addPostFrameCallback((_){
        Navigator.pushReplacementNamed(context, '/');
      });
    }else{
      setState(() {
        _errorText = 'Username atau Password Salah!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700], // Warna latar belakang
      body: Center(
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
                      labelText: "Masukan Username",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Masukan Password",
                      errorText: _errorText.isNotEmpty ? _errorText : null,
                      border: const OutlineInputBorder(),
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
                      onPressed: () {
                        // Tambahkan aksi "Sign in"
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text("Sign in"),
                  ),
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
                            Navigator.pushNamed(context, '/SignUpScreen');
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
    );
  }
}