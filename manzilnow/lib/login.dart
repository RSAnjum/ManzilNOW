import 'package:flutter/material.dart';
import 'package:manzilnow/homepage.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _phoneNumberError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50.0),
              Image.asset(
                'assets/logo.png',
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              const SizedBox(height: 50.0),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
                onChanged: (value) {
                  setState(() {
                    bool isNumeric(String value) {
                      return double.tryParse(value) != null;
                    }

                    if (value.isNotEmpty && !isNumeric(value)) {
                      _phoneNumberError = 'Invalid phone number';
                    } else if (value.length > 11) {
                      _phoneNumberError = 'Phone number is too long';
                    } else {
                      _phoneNumberError = '';
                    }
                  });
                },
                style: _phoneNumberError != ''
                    ? const TextStyle(color: Colors.red)
                    : const TextStyle(color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _phoneNumberError,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomePage()));
                },
                icon: const Icon(Icons.login),
                label: const Text('Login'),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                  );
                },
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                ),
                child: const Text(
                  'Don\'t have an account? Sign up',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
