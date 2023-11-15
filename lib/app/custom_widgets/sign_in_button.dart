import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
    required this.child,
    required this.color,
    required this.borderRadius,
    required this.onPressed
    });

  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton( 
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
      );
  }
}