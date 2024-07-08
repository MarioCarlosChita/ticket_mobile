import 'package:flutter/material.dart';
import 'package:ticket_mobile/core/injector/index.dart';
import 'package:ticket_mobile/core/router/router.dart';
import 'package:ticket_mobile/core/themes/color_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ticket_mobile/features/auth/domain/usecases/get_user_member_use_case.dart';
import 'package:ticket_mobile/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:ticket_mobile/features/auth/domain/usecases/sign_out_use_case.dart';
import 'package:ticket_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ticket_mobile/features/payment/domain/usecases/ask_payment_use_case.dart';
import 'package:ticket_mobile/features/payment/domain/usecases/get_map_sof_payments_use_case.dart';
import 'package:ticket_mobile/features/payment/domain/usecases/get_payments_use_case.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/ask_payment_bloc/ask_payment_bloc.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/get_map_sof_payment_bloc/get_map_sof_payment_bloc.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/get_payment_bloc/get_payment_bloc.dart';

Future<void> mainApp() async {
  dependecyInitializer();
  WidgetsFlutterBinding.ensureInitialized();

  return runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            getUserMemberUseCase: locator.get<GetUserMemberUseCase>(),
            signInUseCase: locator.get<SignInUseCase>(),
            signOutUseCase: locator.get<SignOutUseCase>(),
          ),
        ),
        BlocProvider(
          create: (_) => GetPaymentBloc(
            getPaymentsUseCase: locator.get<GetPaymentsUseCase>(),
          ),
        ),
        BlocProvider(
          create: (_) => GetMapSofPaymentBloc(
            getMapSofPaymentUseCase: locator.get<GetMapSofPaymentUseCase>(),
          ),
        ),
        BlocProvider(
          create: (_) => AskPaymentBloc(
            askPaymentUseCase: locator.get<AskPaymentUseCase>(),
          ),
        )
      ],
      child: MaterialApp.router(
        title: '2Ticket',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routerConfig: router,
        locale: const Locale('pt', 'PT'),
        supportedLocales: const [
          Locale('en', 'US'), // Inglês
          Locale('pt', 'PT'),
        ],
        theme: ThemeData(
          colorSchemeSeed: ColorTheme.primaryColor,
        ),
      ),
    ),
  );
}
