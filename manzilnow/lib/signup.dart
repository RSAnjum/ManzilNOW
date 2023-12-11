
import 'package:flutter/material.dart';
import 'login.dart'; // Import the Login class

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _emailError = '';
  String _phoneNumberError = '';
  final RegExp _emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  bool isNumeric(String value) {
    return double.tryParse(value) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                'assets/logo.png',
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                onChanged: (value) {
                  // Check email validity when user finishes typing
                  setState(() {
                    if (value.isNotEmpty && !_emailRegex.hasMatch(value)) {
                      _emailError = 'Invalid email';
                    } else {
                      _emailError = '';
                    }
                  });
                },
                style: _emailError != '' ? const TextStyle(color: Colors.red) : const TextStyle(color: Colors.black),
              ),
            ),
            if (_emailError != '')
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _emailError,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty && !isNumeric(value)) {
                      _phoneNumberError = 'Invalid phone number';
                    } else if (value.length > 11) {
                      _phoneNumberError = 'Phone number is too long';
                    } else {
                      _phoneNumberError = '';
                    }
                  });
                },
                style: _phoneNumberError != '' ? const TextStyle(color: Colors.red) : const TextStyle(color: Colors.black),
              ),
            ),
          
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                _phoneNumberError,
                style: const TextStyle(color: Colors.red),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement sign up logic
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()), // Use the Login class
                );
              },
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
              ),
              child: const Text(
                'Already have an account? Sign in',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
