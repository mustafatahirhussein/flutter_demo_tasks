import 'package:flutter/material.dart';

class CustomCompleteButton extends TextButton {
  CustomCompleteButton({
    required String text,
    required VoidCallback onPressed,
  }) : super(
    child: Text(text),
    onPressed: onPressed,
    style: TextButton.styleFrom(
      alignment: Alignment.center,
      backgroundColor: Colors.blueGrey,
      animationDuration: const Duration(milliseconds: 2000),
      textStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
      elevation: 0,
      enableFeedback: false,
      padding: const EdgeInsets.all(2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    ),
  );
}