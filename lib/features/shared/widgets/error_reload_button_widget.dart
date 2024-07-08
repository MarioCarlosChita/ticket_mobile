import 'package:flutter/material.dart';

class ErrorReloadButtonWidget extends StatelessWidget {
  const ErrorReloadButtonWidget({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 120,
            color: Colors.grey.withOpacity(0.4),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onTap,
                  child: const Text("Tenta novamente"),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
