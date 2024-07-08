import 'package:flutter/material.dart';
import 'package:ticket_mobile/core/extentions/string_extention.dart';
import 'package:ticket_mobile/features/payment/domain/entities/payment_entity.dart';
import 'package:ticket_mobile/features/shared/widgets/payment_status_widget.dart';

class PaymentCardWidget extends StatelessWidget {
  const PaymentCardWidget({
    super.key,
    required this.onTap,
    required this.payment,
    this.hasMargin = false,
  });

  final VoidCallback? onTap;
  final PaymentEntity payment;
  final bool hasMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: hasMargin ? kToolbarHeight + kFloatingActionButtonMargin : 8,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          color: Colors.grey.withOpacity(0.02),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${payment.periodStart.getLongDateFormat()} ${payment.periodEnd.getLongDateFormat()} ",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        PaymentStatusWidget(
                          paymentStatus: payment.status,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                "${payment.total},00€",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
