import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAsI7TbO6ElmRU6oUJXVz_mgbNt5xHNOVw",
            authDomain: "beautyinclusive.firebaseapp.com",
            projectId: "beautyinclusive",
            storageBucket: "beautyinclusive.appspot.com",
            messagingSenderId: "477918184302",
            appId: "1:477918184302:web:b08d6325e158fd1888b77f",
            measurementId: "G-0WNWSSTNTN"));
  } else {
    await Firebase.initializeApp();
  }
}
