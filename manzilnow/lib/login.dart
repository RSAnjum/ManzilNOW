import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:manzilnow/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('passenger');
  String? emailError;
  String? passwordError;

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password cannot be empty';
    }
    return null;
  }

  Future<void> validateFields() async {
    setState(() {
      emailError = validateEmail(emailController.text);
      passwordError = validatePassword(passwordController.text);
    });

    if (emailError == null && passwordError == null) {
      DatabaseEvent event = await dbRef
          .orderByChild("email")
          .equalTo(emailController.text)
          .once();

      // Check if the data exists
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> values =
            event.snapshot.value as Map<dynamic, dynamic>;
        values.forEach((key, user) async {
          if (user["password"] == passwordController.text) {
            saveUserToken(user["passengerId"] ?? "");
            saveUserData(user);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else {
            // Incorrect password
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Incorrect password"),
                duration: Duration(seconds: 2),
              ),
            );
          }
        });
      } else {
        // User with provided email not found
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("User not found"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  Future<void> saveUserToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<void> saveUserData(Map<dynamic, dynamic> userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      prefs.setString('token', userData["userId"] ?? "");
      prefs.setString('email', userData["email"] ?? "");
      prefs.setString('firstName', userData["firstName"] ?? "");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error saving user data: $e"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3, // Increase the height value
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/logo.png',
                  width: 600,
                  height: 800,
                ),
              ),
            ),
            SizedBox(height: 16.0), // Add some space

            // Text "Login" with font size
            Text(
              'Login',
              style: TextStyle(
              fontFamily: 'Sans',
              color: Color(0xFF1F1B2F),
              fontWeight: FontWeight.bold, // Make the text bold
              fontSize: 32,
            ),
            ),
            SizedBox(height: 16.0), // Add some space

            // Text boxes for email and password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 300.0, // Set the desired width for the text field
                    child: TextField(
                      controller: emailController,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        
                        prefixIcon: Icon(Icons.email),
                        errorText: emailError,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0), // Add some space
                  SizedBox(
                    width: 300.0, // Set the desired width for the text field
                    child: TextField(
                      controller: passwordController,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.security),
                        errorText: passwordError,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Dont have an Account Yet? ",),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Color(0xFF1F1B2F), // Set the link color
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.0), // Add some space

            // Button with color and stretched width
            ElevatedButton(
              onPressed: validateFields,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF1F1B2F),
                minimumSize:
                    Size(300.0, 50.0), // Make the button stretched in width
              ),
              child: Text(
                'LOGIN',
                style: TextStyle(
                  fontFamily: 'sans',
                  color: Colors.white, // Set the text color to black
                ),
              ),
            ),
            SizedBox(height: 16.0), // Add some space
          ],
        ),
      ),
    );
  }
}
