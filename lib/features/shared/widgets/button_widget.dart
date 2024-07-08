import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    required this.backgroundColor,
    required this.onPressed,
    this.child,
    this.isEnable = true,
    this.isLoading = false,
    this.height = 48,
    this.text,
    this.textColor = Colors.white,
    this.fontSize = 14,
    super.key,
  });

  final VoidCallback onPressed;
  final Color backgroundColor;
  final Widget? child;
  final double height;
  final String? text;
  final Color? textColor;
  final double fontSize;
  final bool isLoading;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: backgroundColor,
      disabledTextColor: Colors.black,
      disabledColor: Colors.grey.withOpacity(0.2),
      height: height,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      onPressed: isEnable ? onPressed : null,
      child: isLoading
          ? const CircularProgressIndicator(
              strokeWidth: 1,
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.white,
              ),
            )
          : child ??
              Text(
                text ?? "",
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                ),
              ),
    );
  }
}
