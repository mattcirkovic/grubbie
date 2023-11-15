import 'package:flutter/material.dart';
import 'package:grubbie/app/home_page.dart';
//import 'package:grubbie/app/sign_in_page.dart';

void main() {
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
      home: const HomePage(),
    );
  }
}
