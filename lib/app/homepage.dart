import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Welcome',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              ),
            ),
          const SizedBox(height: 8.0),
          ElevatedButton( 
            onPressed: () {print('Button pressed');},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[100],
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              )
            ),
            child: const Text(
              'Sign in with e-mail',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.deepOrange,
              ),)
            ),
        ],
      ),
    );
  }
}
