import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'updateprf.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Change Password'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: currentPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Current Password',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: newPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'New Password',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () => changePassword(),
                      child: Text('Change Password'),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  void changePassword() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String? passengerId = prefs.getString('token');
    String currentPassword = currentPasswordController.text;
    String newPassword = newPasswordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (currentPassword.isEmpty ||
        newPassword.isEmpty ||
        confirmPassword.isEmpty) {
      showSnackBar('Please fill in all fields.');
      return;
    }

    if (newPassword != confirmPassword) {
      showSnackBar('New Password and Confirm Password do not match.');
      return;
    }
    try {
      
      DatabaseReference dbRef =
          FirebaseDatabase.instance.ref().child('passenger/$passengerId');
      DatabaseEvent event = await dbRef.once();

      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> userData =
            event.snapshot.value as Map<dynamic, dynamic>;
        if (userData.containsKey('password') && userData['password'] != null) {
          String storedPassword = userData['password'] as String;

          if (currentPassword != storedPassword) {
            showSnackBar('Current Password is incorrect.');
            return;
          }

          await dbRef.child('password').set(newPassword);

          // Display a success message
          showSnackBar('Password changed successfully');

          // If successful, navigate to the UpdateProfile screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => UpdateProfile()),
          );
        } else {
          showSnackBar('Error: Password field not found or is null.');
        }
      } else {
        showSnackBar('Error: User data is null.');
      }
    } catch (error) {
      // Handle errors

      showSnackBar('Error changing password. Please try again.');
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
