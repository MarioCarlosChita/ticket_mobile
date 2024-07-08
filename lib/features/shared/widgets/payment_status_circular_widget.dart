import 'package:flutter/material.dart';
import 'package:ticket_mobile/core/enums/payment_status_enum.dart';

enum PaymentStatuColor {
  active(
    Colors.green,
    Colors.white,
    Icons.check,
  ),
  history(
    Colors.red,
    Colors.white,
    Icons.report,
  ),
  pending(
    Colors.orange,
    Colors.white,
    Icons.info,
  ),
  unknown(
    Colors.blueGrey,
    Colors.white,
    Icons.question_mark,
  );

  const PaymentStatuColor(
    this.backgroundColor,
    this.iconColor,
    this.icon,
  );

  final Color iconColor;
  final Color backgroundColor;
  final IconData icon;
}

class PaymentStatusCircularWidget extends StatelessWidget {
  const PaymentStatusCircularWidget({
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
      width: 90,
      height: 90,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _status.backgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(
        _status.icon,
        color: _status.iconColor,
        size: 62,
      ),
    );
  }
}
