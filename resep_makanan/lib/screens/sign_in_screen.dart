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

  final String _errorText = '';

  final bool _isSignedIn = false;

  bool _obscurePassword = true;

  void _signIn() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String savedUsername = prefs.getString('username') ?? '';
    final String savedPassword = prefs.getString('password') ?? '';
    final String enteredUsername = _usernameController.text.trim();
    final String enteredPassword = _passwordController.text.trim();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2. Pasang AppBar
      appBar: AppBar(title: const Text('Sign In'),),
      // TODO: 3. Pasang Body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
                child: Column(
                  // TODO: 4. Atur mainAxisAlignment dan crossAxisAlignment
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // TODO: 5. Pasang TextFormField nama pengguna
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: "Nama Pengguna",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    // TODO: 6. Pasang TextFormField Kata Sandi
                    const SizedBox(height: 20),
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
                    // TODO: 7. Pasang ElevatedButton Sign In
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: (){},
                        child: const Text('Sign In')),
                    // TODO: 8. PASANG TextButton Sign Up
                    const SizedBox(height: 10),
                    TextButton(
                        onPressed: (){},
                        child: const Text('Belum punya Akun? Daftar disini!')),
                    RichText(
                        text: TextSpan(
                          text: 'Belum punya Akun?',
                          style: const TextStyle(fontSize: 16, color: Colors.deepPurple),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Daftar di sini!',
                              style: const TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  fontSize: 16
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '/signup');
                                },
                            ),
                          ],
                        ))
                  ],
                )),
          ),
        ),
      ),
    );
  }
}