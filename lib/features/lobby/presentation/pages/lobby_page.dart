import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_mobile/core/themes/color_theme.dart';
import 'package:ticket_mobile/core/utils/strings.dart';
import 'package:ticket_mobile/features/auth/domain/entity/user_member_entity.dart';
import 'package:ticket_mobile/features/lobby/presentation/pages/home_page.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/ask_payment_bloc/ask_payment_bloc.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/ask_payment_bloc/ask_payment_event.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/get_map_sof_payment_bloc/get_map_sof_payment_bloc.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/get_map_sof_payment_bloc/get_map_sof_payment_event.dart';
import 'package:ticket_mobile/features/payment/presentation/widgets/payment_process_widget.dart';
import 'package:ticket_mobile/features/profile/presentation/pages/profile_page.dart';

class LobbyPage extends StatefulWidget {
  const LobbyPage({
    required this.userMember,
    super.key,
  });

  final UserMemberEntity userMember;

  @override
  State<LobbyPage> createState() => _LobyPageState();
}

class _LobyPageState extends State<LobbyPage> {
  int _currentIndex = 0;
  void _showMakePaymentBottomSheet() {
    context.read<AskPaymentBloc>().add(AskPaymentResetRequested());
    context.read<GetMapSofPaymentBloc>().add(
          GetMapSofPaymentRequested(),
        );

    return PaymentProcessWidget.showPaymentProcess(
      context: context,
      onPressed: () {},
      userMember: widget.userMember,
    );
  }

  List<Widget> get _screens => [
        HomePage(
          userMember: widget.userMember,
        ),
        ProfilePage(
          userMember: widget.userMember,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton.extended(
              backgroundColor: ColorTheme.primaryColor,
              label: const Text(
                regularizefee,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: _showMakePaymentBottomSheet,
            )
          : const SizedBox.shrink(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: home,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: profile,
          ),
        ],
      ),
    );
  }
}
