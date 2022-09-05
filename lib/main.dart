import 'package:chat_application/views/signin.dart';
import 'package:chat_application/views/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'helper/authenticate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 6, 53, 92),
        scaffoldBackgroundColor: const Color.fromARGB(255, 22, 22, 22),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Authenticate(),
    );
  }
}
