import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/get_payment_bloc/get_payment_bloc.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/get_payment_bloc/get_payment_state.dart';
import 'package:ticket_mobile/features/shared/widgets/error_reload_button_widget.dart';
import 'package:ticket_mobile/features/shared/widgets/payment_card_skeleton_widget.dart';
import 'package:ticket_mobile/features/shared/widgets/payment_card_widget.dart';

import '../../domain/entities/payment_entity.dart';

class PaymentListCardWidget extends StatefulWidget {
  const PaymentListCardWidget({
    required this.onSelectedPayment,
    required this.onPressedErrorButton,
    super.key,
  });

  final VoidCallback onPressedErrorButton;
  final Function(PaymentEntity) onSelectedPayment;

  @override
  State<PaymentListCardWidget> createState() => _PaymentListCardWidgetState();
}

class _PaymentListCardWidgetState extends State<PaymentListCardWidget> {
  @override
  Widget build(BuildContext context) {
    Size kDeviceSize = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: SizedBox(
        height: kDeviceSize.height -
            kBottomNavigationBarHeight -
            200 -
            kToolbarHeight -
            56,
        child: BlocBuilder<GetPaymentBloc, GetPaymentState>(
          builder: (BuildContext context, GetPaymentState state) {
            if (state is GetPaymentFailed) {
              return ErrorReloadButtonWidget(
                onTap: widget.onPressedErrorButton,
              );
            }

            if (state is GetPaymentSuccess) {
              List<PaymentEntity> payments = state.paymentResponse.payments;
              debugPrint("------  ${payments.length.toString()} ------ ");
              return ListView.builder(
                itemCount: payments.length,
                itemBuilder: (BuildContext context, int index) {
                  return PaymentCardWidget(
                    payment: payments[index],
                    onTap: () => widget.onSelectedPayment(payments[index]),
                    hasMargin: index + 1 == payments.length,
                  );
                },
              );
            }
            return const PaymentListCardSkeletonWidegt(
              itemCount: 10,
            );
          },
        ),
      ),
    );
  }
}
