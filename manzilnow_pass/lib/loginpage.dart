import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthPage(),
      ),
    );

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isVisible = false;
  // ignore: unused_field
  bool _isPasswordEightCharacters = false;
  // ignore: unused_field
  bool _hasPasswordOneNumber = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _emailError = false;
  bool _passwordError = false;
  String _errorText = '';

  void onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');

    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) {
        _isPasswordEightCharacters = true;
      }

      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) {
        _hasPasswordOneNumber = true;
      }
    });
  }

  void signIn() {
    // Add your sign-in logic here
    // For testing purposes, assume invalid email/phone
    setState(() {
      _emailError = true;
      _errorText = 'Invalid email/phone';
    });
  }

  void signUp() {
    // Add your sign-up logic here
    // For testing purposes, assume account does not exist
    setState(() {
      _emailError = true;
      _errorText = 'Account does not exist';
    });
  }

  void loginWithGoogle() {
    // Add your Google login logic here
    // For testing purposes, assume incorrect password
    setState(() {
      _passwordError = true;
      _errorText = 'Incorrect password';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Auth Page",
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.grey[700],
            ),
            onPressed: () {
              // Handle settings button press
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Login / Sign Up",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10,),
            Text(
              "Please enter your email/phone and password to proceed.",
              style: TextStyle(fontSize: 16, height: 1.5, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 30,),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: _emailError ? Colors.red : Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: _emailError ? Colors.red : Colors.black),
                ),
                hintText: "Email/Phone",
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              ),
            ),
            if (_emailError) ...[
              const SizedBox(height: 5,),
              Text(
                _errorText,
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ],
            const SizedBox(height: 20,),
            TextField(
              controller: _passwordController,
              onChanged: (password) => onPasswordChanged(password),
              obscureText: !_isVisible,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  icon: _isVisible
                      ? const Icon(Icons.visibility, color: Colors.black,)
                      : const Icon(Icons.visibility_off, color: Colors.grey,),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: _passwordError ? Colors.red : Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: _passwordError ? Colors.red : Colors.black),
                ),
                hintText: "Password",
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              ),
            ),
            if (_passwordError) ...[
              const SizedBox(height: 5,),
              Text(
                _errorText,
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ],
            const SizedBox(height: 30,),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    height: 40,
                    onPressed: signIn,
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text("Sign In", style: TextStyle(color: Colors.white),),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: MaterialButton(
                    height: 40,
                    onPressed: signUp,
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text("Sign Up", style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            MaterialButton(
              height: 40,
              onPressed: loginWithGoogle,
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/google_logo.png", height: 20, width: 20,),
                  const SizedBox(width: 10,),
                  const Text("Login with Google", style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
