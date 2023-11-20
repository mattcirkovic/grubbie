// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grubbie/app/custom_widgets/custom_button.dart';
import 'package:grubbie/services/auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key, required this.auth, required this.onSignIn});

  final AuthBase auth;
  final void Function(User?) onSignIn;

  Future<void> _signInAnonomously() async {
    try {
      final user = await auth.signInAnonomously();
      onSignIn(user);
    } catch(e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
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
          const SizedBox(height: 32.0),
          CustomButton(
            label: 'Sign in with e-mail',
            color: Colors.white,
            fontColor: Colors.deepOrange,
            onPressed: _signInAnonomously,
            borderRadius: 8.0,
          ),
          TextButton(
            onPressed: () {print('Button pressed');
            },
            child: const Text(
              'Don\'t have an account?',
              style: TextStyle(
                color: Colors.white
              ),
            ))
        ],
      ),
    );
  }
}
