import 'package:flutter/material.dart';
import 'package:ticket_mobile/core/enums/payment_status_enum.dart';

enum PaymentStatuColor {
  active(Colors.green, Colors.white, "active"),
  history(Colors.red, Colors.white, "history"),
  pending(Colors.orange, Colors.white, "pending"),
  unknown(Colors.blueGrey, Colors.white, "unknown");

  const PaymentStatuColor(
    this.backgroundColor,
    this.textColor,
    this.text,
  );

  final Color textColor;
  final Color backgroundColor;
  final String text;
}

class PaymentStatusWidget extends StatelessWidget {
  const PaymentStatusWidget({
    super.key,
    required this.paymentStatus,
  });
  final PaymentStatus paymentStatus;

  PaymentStatuColor get _status => switch (paymentStatus) {
        PaymentStatus.active => PaymentStatuColor.active,
        PaymentStatus.history => PaymentStatuColor.history,
        PaymentStatus.pending => PaymentStatuColor.pending,
        PaymentStatus.unknown => PaymentStatuColor.unknown
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: _status.backgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        _status.text,
        style: TextStyle(
          color: _status.textColor,
        ),
      ),
    );
  }
}
