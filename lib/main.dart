import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:grubbie/app/landing_page.dart';
import 'firebase_options.dart';
//import 'package:grubbie/app/sign_in_page.dart';

Future <void> main() async {

  // initialize firebase for the app using the options from firebase_options.dart
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Grubbie());
}

class Grubbie extends StatelessWidget {
  const Grubbie({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grubbie',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const LandingPage(),
    );
  }
}
