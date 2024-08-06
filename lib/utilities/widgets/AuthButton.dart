import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final VoidCallback? onPressed;

  const AuthButton(
      {super.key, this.buttonColor, this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonText,
          ),
        ),
      ),
    );
  }
}
