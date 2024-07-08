// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_mobile/core/enums/routes_enum.dart';
import 'package:ticket_mobile/core/helpers/snackbar_helper.dart';
import 'package:ticket_mobile/core/themes/color_theme.dart';
import 'package:ticket_mobile/core/utils/app_images.dart';
import 'package:ticket_mobile/core/utils/strings.dart';
import 'package:ticket_mobile/features/auth/domain/entity/user_member_entity.dart';
import 'package:ticket_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ticket_mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:ticket_mobile/features/auth/presentation/bloc/auth_state.dart';
import 'package:ticket_mobile/features/shared/widgets/button_widget.dart';
import 'package:ticket_mobile/features/shared/widgets/dialog_widget.dart';
import 'package:ticket_mobile/features/shared/widgets/title_and_description_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    required this.userMember,
    super.key,
  });

  final UserMemberEntity userMember;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> _onLogout() async {
    final bool? dialogStatus = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return DialogWidget(
          description: appExitMessage,
          leftButtonAction: () => context.pop(false),
          leftButtonTitle: no,
          rightButtonAction: () => context.pop(true),
          rightButtonTitle: yes,
          title: logout,
        );
      },
    );
    final comfirmStatus = dialogStatus ?? false;
    if (comfirmStatus) {
      context.read<AuthBloc>().add(AuthSignOutRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      profile,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: Image.network(
                            widget.userMember.imageFilename,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                AppImages.userAvatarError,
                              );
                            },
                          ).image,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 64,
                ),
                SizedBox(
                  width: double.infinity,
                  child: PhysicalModel(
                    color: Colors.white,
                    elevation: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TitleAndDescriptionProfileWidget(
                          title: name,
                          description: widget.userMember.name,
                        ),
                        TitleAndDescriptionProfileWidget(
                          title: "$email : ",
                          description: widget.userMember.email,
                        ),
                        TitleAndDescriptionProfileWidget(
                          title: address,
                          description: widget.userMember.address,
                        ),
                        TitleAndDescriptionProfileWidget(
                          title: postalcode,
                          description: widget.userMember.postalcode,
                        ),
                        TitleAndDescriptionProfileWidget(
                          title: city,
                          description: widget.userMember.city,
                        ),
                        TitleAndDescriptionProfileWidget(
                          title: country,
                          description: widget.userMember.country,
                          hasBottomMargin: false,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 64,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    child: BlocConsumer<AuthBloc, AuthState>(
                      listener: (BuildContext context, AuthState state) {
                        if (state is AuthFailed) {
                          SnackBarHelper.showSnackBar(
                            context: context,
                            message: state.message,
                          );
                        }
                        if (state is AuthSignOutSuccess) {
                          Routes.login.go(context);
                        }
                      },
                      builder: (BuildContext context, AuthState state) {
                        return ButtonWidget(
                          isLoading: state is AuthLoading,
                          backgroundColor: ColorTheme.primaryColor,
                          text: exit,
                          onPressed: () async {
                            if (state is! AuthLoading) {
                              await _onLogout();
                            }
                          },
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
