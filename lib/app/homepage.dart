import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grubbie'),
      ),
      body: Container(
        color: Colors.amber,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.brown,
              child: SizedBox(
                height: 100.0,
              ),
            ),
            Container(
              color: Colors.red,
              child: SizedBox(
                height: 100.0,
              ),
            ),
            Container(
              color: Colors.orange,
              child: SizedBox(
                height: 100.0,
              ),
            ),
          ],
        ),
      )
    );
  }
}
