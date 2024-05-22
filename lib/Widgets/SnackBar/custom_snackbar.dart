import 'package:flutter/material.dart';
import 'package:bussines_owner/Constants/constants.dart'; // Adjust the import as necessary

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({
    super.key,
    required this.msg,
    this.msgSize,
    this.msgColor,
    required this.snackBarBackgroundColor,
  });

  final String msg;
  final double? msgSize;
  final Color? msgColor;
  final Color snackBarBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: msgSize ?? 20.0, color: msgColor ?? Colors.white),
      ),
      backgroundColor: snackBarBackgroundColor,
      duration: const Duration(seconds: 5),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
    );
  }
}
