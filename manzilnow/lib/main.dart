import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'intro.dart';
import 'temp.dart';
import 'home2.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyCLKQ7Aehh1gVhqTQ7QmMlOB1DAVpbX098",
            appId: "1:930777869598:android:2f07325d0e4082f5d3ad0f",
            messagingSenderId: "167105191237",
            projectId: "manzilnow",
            storageBucket: "manzilnow.appspot.com",
          ),
        )
      : null;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor:
            Colors.cyan[700], // Set the primary color to a shade of cyan
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
      backgroundColor:
          const Color(0xFF1F1B2F), // Set the background color to #1F1B2F
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Image.asset(
                'assets/splash.png',
                fit: BoxFit.cover, // Make the image fill the screen
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              const Color(0xFF0DF5E3), // Set the background color to #0DF5E3
          padding: const EdgeInsets.symmetric(
              vertical: 24, horizontal: 32), // Increase padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50), // Make the button circular
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LandingWidget()),
          );
        },
        child: const Text(
          'GET STARTED',
          style: TextStyle(
            fontFamily: 'Sans',
            color: Color(0xFF1F1B2F),
            fontWeight: FontWeight.bold, // Make the text bold
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
