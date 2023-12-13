import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:manzilnow/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'changepwd.dart';

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  DateTime? selectedDate;
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child('passenger');
  @override
  void initState() {
    super.initState();
    updateTextField();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          String? firstName = snapshot.data?.getString('firstName');

          return Scaffold(
            appBar: AppBar(
              title: Text('Update Profile'),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.0),
                    Text(
                      'Update Profile',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    SizedBox(height: 8.0),
                    Text(
                      '   Hey, $firstName!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      width: 300.0,
                      child: TextField(
                        controller: firstNameController,
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    SizedBox(
                      width: 300.0,
                      child: TextField(
                        controller: lastNameController,
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          prefixIcon: Icon(Icons.person_2),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    SizedBox(
                      width: 300.0,
                      child: TextField(
                        controller: phoneNumberController,
                        style: TextStyle(fontSize: 15),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    SizedBox(
                      width: 300.0,
                      child: TextFormField(
                        controller: TextEditingController(
                          text: selectedDate != null
                              ? selectedDate!.toLocal().toString().split(' ')[0]
                              : '',
                        ),
                        style: TextStyle(fontSize: 10),
                        decoration: InputDecoration(
                          labelText: 'Date of Birth',
                          prefixIcon: Icon(Icons.calendar_today),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );

                          if (pickedDate != null &&
                              pickedDate != selectedDate) {
                            setState(() {
                              selectedDate = pickedDate;
                            });
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChangePasswordScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Change Your Password",
                            style: TextStyle(
                              color: Color.fromARGB(255, 240, 6, 6),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    ElevatedButton(
                      onPressed: () async {
                        await updateProfile(snapshot.data);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF4A5899),
                        minimumSize: Size(120.0, 50.0),
                      ),
                      child: const Text(
                        'Update',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 16.0),
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

  Future<void> updateProfile(SharedPreferences? prefs) async {
    ///////////////
    String? passengerId = prefs?.getString('token');
    ///////////////////
    String value = phoneNumberController.text;

    DatabaseReference dbRef =
        FirebaseDatabase.instance.ref().child('passenger/$passengerId');
    if (firstNameController.text != "" &&
        lastNameController.text != "" &&
        phoneNumberController.text != "" &&
        selectedDate?.toIso8601String() != "") {
      await dbRef.update({
        if (firstNameController.text != "")
          'firstName': firstNameController.text,
        if (lastNameController.text != "") 'lastName': lastNameController.text,
        if (phoneNumberController.text != "" && value.length == 10)
          'phoneNumber': phoneNumberController.text,
        if (selectedDate?.toIso8601String() != "")
          'dateOfBirth': selectedDate?.toIso8601String(),
      });

      await prefs?.setString('firstName', firstNameController.text);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Changes saved"),
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Error: No Changes were Saved"),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> updateTextField() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? passengerId = prefs.getString('token');
      DatabaseReference dbRef =
          FirebaseDatabase.instance.ref().child('passenger/$passengerId');
      DatabaseEvent event = await dbRef.once();

      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> userData =
            event.snapshot.value as Map<dynamic, dynamic>;

        setState(() {
          firstNameController.text = userData["firstName"] ?? "";
          lastNameController.text = userData["lastName"] ?? "";
          phoneNumberController.text = userData["phoneNumber"] ?? "";
        });
      }
    } catch (error) {
      print('Error updating text fields: $error');
    }
  }
}
