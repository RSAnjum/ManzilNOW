import 'login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Passenger {
  late String firstName;
  late String lastName;
  late String email;
  late String password;
  late String phoneNumber;
  late String? gender;
  late String? dateOfBirth;
}

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final Passenger driver = Passenger();
  final databaseReference = FirebaseDatabase.instance.reference().child("passenger");
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  String? selectedGender;
  DateTime? selectedDate;
  late String passengerID;

  bool validateEmail(String email) {
    // Basic email validation using regex
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+$",
    ).hasMatch(email);
  }

  bool validatePhoneNumber(String phoneNumber) {
    // Validate phone number consists of 10 digits
    return phoneNumber.length == 10 && int.tryParse(phoneNumber) != null;
  }

  void validateAndSubmit() {
    if (
      firstNameController.text.isEmpty ||
      lastNameController.text.isEmpty ||
      emailController.text.isEmpty ||
      passwordController.text.isEmpty ||
      phoneNumberController.text.isEmpty ||
      selectedGender == null ||
      selectedDate == null
    ) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter all fields"),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (!validateEmail(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a valid email address"),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (!validatePhoneNumber(phoneNumberController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a valid phone number"),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    passengerID = DateTime.now().microsecondsSinceEpoch.toString();

    // Set user details
    driver.firstName = firstNameController.text;
    driver.lastName = lastNameController.text;
    driver.email = emailController.text;
    driver.password = passwordController.text;
    driver.phoneNumber = phoneNumberController.text;
    driver.gender = selectedGender;
    driver.dateOfBirth = selectedDate!.toIso8601String();

    // Add user details to the Firebase Realtime Database
    databaseReference.child(passengerID).set({
      "passengerId": passengerID,
      "firstName": driver.firstName,
      "lastName": driver.lastName,
      "email": driver.email,
      "password": driver.password,
      "phoneNumber": driver.phoneNumber,
      "dateOfBirth": driver.dateOfBirth,
      "gender": driver.gender,
      "restrictUser": false,
    });

    // Navigate to the next screen (VehicleRegistration)
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/logo.png',
                  width: 400,
                  height: 600,
                ),
              ),
            ),
            SizedBox(height: 25.0),
            Text(
              'Signup',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50.0),
            SizedBox(
              width: 300.0,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: firstNameController,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'First Name',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: TextField(
                      controller: lastNameController,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Last Name',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0),
            SizedBox(
              width: 300.0,
              child: TextField(
                controller: emailController,
                style: TextStyle(
                  fontSize: 15,
                ),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Enter your email ID',
                ),
              ),
            ),
            SizedBox(height: 15.0),
            SizedBox(
              width: 300.0,
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
                ),
              ),
            ),
            SizedBox(height: 15.0),
            SizedBox(
              width: 300.0,
              child: TextField(
                controller: phoneNumberController,
                style: TextStyle(
                  fontSize: 15,
                ),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                  prefixText: '+92 ',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            SizedBox(
              width: 300.0,
              child: DropdownButtonFormField<String>(
                value: selectedGender,
                isDense: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Gender',
                  prefixIcon: Icon(Icons.person_2_outlined),
                ),
                items: <String>['Male', 'Female', 'Other']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
            ),
            SizedBox(height: 15.0),
            SizedBox(
              width: 300.0,
              child: TextFormField(
                style: TextStyle(
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
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

                  if (pickedDate != null && pickedDate != selectedDate) {
                    // Date selected
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
              ),
            ),
           // ... (Previous code)

            SizedBox(height: 10.0),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already Have an Account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: Color(0xFF4A5899), // Set the link color
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),

            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: validateAndSubmit,
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF4A5899),
                  minimumSize: Size(120.0, 50.0),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),

                       SizedBox(height: 16.0),

          ],
        ),
      ),
    );
  }
}
