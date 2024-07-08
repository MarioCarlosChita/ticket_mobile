import 'package:flutter/material.dart';

class PaymentDetailTitleAndDescriptionWidget extends StatelessWidget {
  const PaymentDetailTitleAndDescriptionWidget({
    this.hasMarginBottom = true,
    required this.description,
    required this.title,
    super.key,
  });

  final String title;
  final String description;
  final bool hasMarginBottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              description,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        hasMarginBottom
            ? const SizedBox(
                height: 32,
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
