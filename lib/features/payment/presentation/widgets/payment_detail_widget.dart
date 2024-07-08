import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_mobile/core/extentions/string_extention.dart';
import 'package:ticket_mobile/core/injector/index.dart';
import 'package:ticket_mobile/core/services/share_service.dart';
import 'package:ticket_mobile/core/themes/color_theme.dart';
import 'package:ticket_mobile/core/utils/strings.dart';
import 'package:ticket_mobile/features/payment/domain/entities/payment_entity.dart';

import 'package:ticket_mobile/features/shared/widgets/bottom_sheet_draggable_indicator_widget.dart';
import 'package:ticket_mobile/features/shared/widgets/button_widget.dart';
import 'package:ticket_mobile/features/shared/widgets/payment_detail_title_and_description.dart';
import 'package:ticket_mobile/features/shared/widgets/payment_status_circular_widget.dart';
import 'package:ticket_mobile/features/shared/widgets/payment_status_widget.dart';

class PaymentDetailWidget extends StatefulWidget {
  const PaymentDetailWidget({
    super.key,
    required this.payment,
    required this.context,
  });

  final PaymentEntity payment;
  final BuildContext context;

  static void showPaymentDetail({
    required BuildContext context,
    required PaymentEntity payment,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            10.0,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext _) {
        return PaymentDetailWidget(
          payment: payment,
          context: context,
        );
      },
    );
  }

  @override
  State<PaymentDetailWidget> createState() => _PaymentDetailWidgetState();
}

class _PaymentDetailWidgetState extends State<PaymentDetailWidget> {
  void _onShareData() async {
    final Map<String, dynamic> dataShare = {
      "text":
          "Codigo do Pagamento:${widget.payment.paymentId} || Quantidade: ${widget.payment.quantity} || Metodo de Pagamento : ${widget.payment.paymentType.name}",
      "title": "Detalhe da Quota",
      "linkUrl": "https://2ticket.pt/",
    };
    await locator.get<ShareService>().share(dataShare);
  }

  @override
  Widget build(BuildContext context) {
    Size kDeviceSize = MediaQuery.of(context).size;

    return Container(
      height: kDeviceSize.height * 0.8,
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 8,
        left: 16,
        right: 8,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const BottomSheetDraggableIndicator(),
            const SizedBox(
              height: 32,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  feedetails,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                ),
                IconButton(
                  onPressed: () => widget.context.pop(),
                  icon: const Icon(
                    Icons.close,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            PaymentStatusCircularWidget(
              paymentStatus: widget.payment.status,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "€ ",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 32),
                ),
                Text(
                  widget.payment.total.toString().digitValidFormat(),
                  style: const TextStyle(fontSize: 32),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  PaymentDetailTitleAndDescriptionWidget(
                    title: paymentCode,
                    description: widget.payment.paymentId.toString(),
                  ),
                  PaymentDetailTitleAndDescriptionWidget(
                    title: amount,
                    description: widget.payment.quantity.toString(),
                  ),
                  PaymentDetailTitleAndDescriptionWidget(
                    title: paymentMethod,
                    description: widget.payment.paymentType.name
                        .toString()
                        .toUpperCase(),
                  ),
                  PaymentDetailTitleAndDescriptionWidget(
                    title: paymentDate,
                    description: widget.payment.paymentDatetime.getDate(),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        feeStatus,
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      PaymentStatusWidget(
                        paymentStatus: widget.payment.status,
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Expanded(
                  child: ButtonWidget(
                    backgroundColor: ColorTheme.primaryColor,
                    onPressed: () async => _onShareData(),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          shareTextAndLink,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(
                          Icons.share,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
