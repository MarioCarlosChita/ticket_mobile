import 'package:flutter/material.dart';
import 'package:ticket_mobile/core/themes/color_theme.dart';
import 'package:ticket_mobile/core/utils/app_images.dart';
import 'package:ticket_mobile/features/shared/models/payment_method_item_data.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({
    required this.onSelected,
    super.key,
  });

  final Function(PaymentMethodItemData) onSelected;

  @override
  State<PaymentMethodWidget> createState() => _PaymentListMethodWidgetState();
}

class _PaymentListMethodWidgetState extends State<PaymentMethodWidget> {
  PaymentMethodItemData? _selectedPaymentMethod;

  List<PaymentMethodItemData> get _paymentMethods => [
        PaymentMethodItemData(
          imageUrl: AppImages.mbwayPayment,
          text: "MBway",
          value: "mbway",
        ),
        PaymentMethodItemData(
          imageUrl: AppImages.paypalPayment,
          text: "Paypal",
          value: "paypal",
        ),
        PaymentMethodItemData(
          imageUrl: AppImages.mbrefPayment,
          text: "Mbref",
          value: "mbref",
        ),
        PaymentMethodItemData(
          imageUrl: AppImages.cashPayment,
          text: "Cash",
          value: "cash",
        ),
        PaymentMethodItemData(
          imageUrl: AppImages.stripePayment,
          text: 'Stripe',
          value: 'stripe',
        ),
        PaymentMethodItemData(
          imageUrl: AppImages.offerPayment,
          text: "Offer",
          value: "offer",
        ),
        PaymentMethodItemData(
          imageUrl: AppImages.cardPayment,
          text: "Cards",
          value: "cards",
        ),
        PaymentMethodItemData(
          imageUrl: AppImages.mbPayment,
          text: "MB",
          value: "mb",
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _paymentMethods.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: index + 1 == _paymentMethods.length ? 0 : 16,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return PaymentMethodItemWidget(
            paymentMethodItemData: _paymentMethods[index],
            isSelected:
                _selectedPaymentMethod?.value == _paymentMethods[index].value,
            onTap: () {
              setState(
                () {
                  _selectedPaymentMethod = _paymentMethods[index];
                  widget.onSelected(_paymentMethods[index]);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class PaymentMethodItemWidget extends StatelessWidget {
  const PaymentMethodItemWidget({
    required this.isSelected,
    required this.paymentMethodItemData,
    required this.onTap,
    super.key,
  });

  final PaymentMethodItemData paymentMethodItemData;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? ColorTheme.primaryColor : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(paymentMethodItemData.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              paymentMethodItemData.text,
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
