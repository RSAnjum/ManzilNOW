
import 'package:flutter/material.dart';
import 'package:manzilnow/complaint.dart';
import 'package:manzilnow/feedback.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _passwordVisible = false;
  String _phoneNumberError ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50.0),
              Image.asset(
                'assets/logo.png',
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              SizedBox(height: 50.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
                onChanged: (value) {
                  setState(() {
                    bool isNumeric(String value) {
                      if (value == null) {
                        return false;
                      }
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
                style: _phoneNumberError != '' ? TextStyle(color: Colors.red) : TextStyle(color: Colors.black),
              ),
              if (_phoneNumberError != null)
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    _phoneNumberError,
                    style: TextStyle(color: Colors.red),
                  ),
                ),

              SizedBox(height: 16.0),
              ElevatedButton.icon(
                onPressed: () {
                },
                icon: Icon(Icons.login),
                label: Text('Login'),
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                ),
                child: Text(
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
