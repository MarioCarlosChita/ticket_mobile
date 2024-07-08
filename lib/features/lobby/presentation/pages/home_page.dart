import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_mobile/core/themes/color_theme.dart';
import 'package:ticket_mobile/core/utils/app_images.dart';
import 'package:ticket_mobile/core/utils/strings.dart';
import 'package:ticket_mobile/features/auth/domain/entity/user_member_entity.dart';
import 'package:ticket_mobile/features/payment/domain/entities/payment_entity.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/get_payment_bloc/get_payment_bloc.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/get_payment_bloc/get_payment_event.dart';
import 'package:ticket_mobile/features/payment/presentation/widgets/payment_detail_widget.dart';
import 'package:ticket_mobile/features/payment/presentation/widgets/payment_list_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    required this.userMember,
    super.key,
  });

  final UserMemberEntity userMember;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showPaymentDetailBottomSheet(
    PaymentEntity payment,
  ) {
    PaymentDetailWidget.showPaymentDetail(
      context: context,
      payment: payment,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 200.0,
          backgroundColor: ColorTheme.primaryColor,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              top: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 48,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.network(
                      widget.userMember.imageFilename,
                      errorBuilder: (
                        BuildContext context,
                        Object error,
                        StackTrace? stackTrace,
                      ) {
                        return Image.asset(
                          AppImages.userAvatarError,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  widget.userMember.name,
                  style: TextStyle(
                    color: Colors.black.withOpacity(
                      0.3,
                    ),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// TODO(Mario): User category doesn't come has user member attribute.
                        Text(
                          category,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
                          partner,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          partnerNumber,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          widget.userMember.code,
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              top: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fee,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  manageMembershipfees,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
        PaymentListCardWidget(
          onPressedErrorButton: () {
            context.read<GetPaymentBloc>().add(GetPaymentRequested());
          },
          onSelectedPayment: _showPaymentDetailBottomSheet,
        )
      ],
    );
  }
}
