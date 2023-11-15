import 'package:flutter/material.dart';
import 'package:grubbie/app/custom_widgets/sign_in_button.dart';

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
    return const Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Welcome',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              ),
            ),
          SizedBox(height: 8.0),
          SignInButton(),
          ],
      ),
    );
  }
}
