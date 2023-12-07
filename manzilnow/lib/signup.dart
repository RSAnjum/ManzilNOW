
import 'package:flutter/material.dart';
import 'login.dart'; // Import the Login class

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _emailError = '';
  String _phoneNumberError = '';
  RegExp _emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  bool isNumeric(String value) {
    if (value == null) {
      return false;
    }
    return double.tryParse(value) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                'assets/logo.png',
                height: 200,
                width: 200,
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
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
                style: _emailError != '' ? TextStyle(color: Colors.red) : TextStyle(color: Colors.black),
              ),
            ),
            if (_emailError != '')
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  _emailError,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
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
                style: _phoneNumberError != '' ? TextStyle(color: Colors.red) : TextStyle(color: Colors.black),
              ),
            ),
          
            if (_phoneNumberError != null)
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  _phoneNumberError,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement sign up logic
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 10),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()), // Use the Login class
                );
              },
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
              ),
              child: Text(
                'Already have an account? Sign in',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
