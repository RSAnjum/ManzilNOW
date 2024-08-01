import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDtpoYWqDri34pG_aAcjrOyGVGAN4W0IVw",
            authDomain: "manzilnow-becc3.firebaseapp.com",
            projectId: "manzilnow-becc3",
            storageBucket: "manzilnow-becc3.appspot.com",
            messagingSenderId: "155049926723",
            appId: "1:155049926723:web:bbe9a3e3065e91330c74f6",
            measurementId: "G-D1T9C9M2D1"));
  } else {
    await Firebase.initializeApp();
  }
}
