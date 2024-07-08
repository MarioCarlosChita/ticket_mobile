import 'package:flutter/material.dart';

class SnackBarHelper {
  static void showSnackBar({
    required BuildContext context,
    required String message,
    String? boldText,
    bool isSuccess = false,
  }) {
    final SnackBar snackBar = SnackBar(
      duration: const Duration(
        seconds: 5,
      ),
      content: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          children: <TextSpan>[
            if (boldText != null)
              TextSpan(
                text: boldText,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            TextSpan(
              text: message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: isSuccess
          ? Colors.green
          : const Color.fromARGB(
              255,
              25,
              23,
              22,
            ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
