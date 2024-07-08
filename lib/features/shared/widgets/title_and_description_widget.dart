import 'package:flutter/material.dart';

class TitleAndDescriptionProfileWidget extends StatelessWidget {
  const TitleAndDescriptionProfileWidget({
    super.key,
    required this.title,
    required this.description,
    this.hasBottomMargin = true,
  });

  final String title;
  final String description;
  final bool hasBottomMargin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        left: 8,
        right: 8,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          hasBottomMargin
              ? const SizedBox(
                  height: 4,
                )
              : const SizedBox.shrink(),
          hasBottomMargin ? const Divider() : const SizedBox.shrink()
        ],
      ),
    );
  }
}
