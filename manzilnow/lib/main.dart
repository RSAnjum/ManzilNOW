
import 'package:flutter/material.dart';
import 'intro.dart'; // Import the intro.dart file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.cyan[700], // Set the primary color to a shade of cyan
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo.png', // Replace the FlutterLogo with an image named logo.png in the assets folder
              width: 500 * 5, // Increase the width of the image by 5x
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue, // Set the button color to blue
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24), // Increase the padding for a larger button
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => IntroPage()), // Navigate to the IntroPage
          );
        },
        child: const Text(
          'Get Started',
          style: TextStyle(fontSize: 18, color: Colors.white), // Increase the font size and set the text color to white
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
