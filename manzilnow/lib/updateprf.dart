import 'package:flutter/material.dart';

class UpdateProfilePage extends StatefulWidget {
  @override
  _UpdateProfilePageState createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _phoneNumber = '';

  // Function to handle saving changes
  void _saveChanges() {
    // Implement your logic to save changes here
    // For example, you can update the user's profile in the database
    // and show a success message to the user
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: const Text('Changes saved successfully!'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile photo section
            const CircleAvatar(
              radius: 50,
              // Add your logic to display the user's profile photo here
              // You can use a network image or a local image asset
              backgroundImage: AssetImage('assets/driver_photo.png'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement your logic to change profile photo here
              },
              child: Text('Change Profile Photo'),
            ),
            SizedBox(height: 16.0),

            // First name section
            TextField(
              decoration: const InputDecoration(
                labelText: 'First Name',
              ),
              onChanged: (value) {
                setState(() {
                  _firstName = value;
                });
              },
            ),
            const SizedBox(height: 16.0),

            // Last name section
            TextField(
              decoration: InputDecoration(
                labelText: 'Last Name',
              ),
              onChanged: (value) {
                setState(() {
                  _lastName = value;
                });
              },
            ),
            SizedBox(height: 16.0),

            // Email section
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            SizedBox(height: 16.0),

            // Phone number section
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
              onChanged: (value) {
                setState(() {
                  _phoneNumber = value;
                });
              },
            ),
            SizedBox(height: 16.0),

            // Save changes button
            ElevatedButton(
              onPressed: _saveChanges,
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
