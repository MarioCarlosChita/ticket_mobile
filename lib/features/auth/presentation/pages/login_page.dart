import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ticket_mobile/core/enums/routes_enum.dart';
import 'package:ticket_mobile/core/helpers/snackbar_helper.dart';
import 'package:ticket_mobile/core/themes/color_theme.dart';
import 'package:ticket_mobile/core/utils/app_images.dart';
import 'package:ticket_mobile/core/utils/strings.dart';
import 'package:ticket_mobile/core/validators/form_validators.dart';
import 'package:ticket_mobile/features/auth/domain/entity/sign_in_param_entity.dart';
import 'package:ticket_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ticket_mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:ticket_mobile/features/auth/presentation/bloc/auth_state.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/get_payment_bloc/get_payment_bloc.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/get_payment_bloc/get_payment_event.dart';
import 'package:ticket_mobile/features/shared/widgets/button_widget.dart';
import 'package:ticket_mobile/features/shared/widgets/input_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  void _onSubmit() async {
    if (_formKey.currentState!.saveAndValidate()) {
      final String email = _formKey.currentState!.value['email'].toString();
      final String password =
          _formKey.currentState!.value['password'].toString();

      context.read<AuthBloc>().add(
            AuthSignInRequested(
              signInParam: SignInParamEntity(
                password: password,
                username: email,
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (BuildContext context, AuthState state) {
              /// Go to lobby screen
              if (state is AuthSignInSuccess) {
                context.read<GetPaymentBloc>().add(GetPaymentRequested());
                Routes.lobby.go(
                  context,
                  extra: state.userMember,
                );
              }
              if (state is AuthInvalidCredential) {
                SnackBarHelper.showSnackBar(
                  context: context,
                  boldText: invalidcredential,
                  message: pleaseTryAgain,
                );
              }

              if (state is AuthFailed) {
                SnackBarHelper.showSnackBar(
                  context: context,
                  message: state.message,
                );
              }
            },
            builder: (BuildContext context, AuthState state) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 56,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        AppImages.logo,
                        width: 180,
                        height: 180,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      signInToYourAccount,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          dontHaveAnAccount,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        TextButton(
                          onPressed: () {
                            // TODO (Mario): Add implementation.
                          },
                          child: Text(
                            signUp,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: [
                          InputFieldWidget(
                            name: 'email',
                            formKey: _formKey,
                            label: email,
                            validatorMode: FormValidatorMode.email,
                            keyboardType: TextInputType.emailAddress,
                            inputEmptyValidationText: requiredField,
                            inputInvalidValidationText: validEmail,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          InputFieldWidget(
                            name: 'password',
                            isPasswordModeEnabled: true,
                            formKey: _formKey,
                            label: password,
                            validatorMode: FormValidatorMode.passwordRegister,
                            inputEmptyValidationText: requiredField,
                            inputInvalidValidationText: invalidPassword,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO (Mario): Add implementation.
                      },
                      child: Text(
                        forgetYourPassword,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        textAlign: TextAlign.center,
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
                            text: logIn,
                            isLoading: state is AuthLoading,
                            onPressed: () {
                              if (state is! AuthLoading) {
                                _onSubmit();
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
