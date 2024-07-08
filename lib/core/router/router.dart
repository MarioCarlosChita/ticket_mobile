import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ticket_mobile/core/enums/routes_enum.dart';
import 'package:ticket_mobile/features/auth/domain/entity/user_member_entity.dart';
import 'package:ticket_mobile/features/auth/presentation/pages/login_page.dart';
import 'package:ticket_mobile/features/lobby/presentation/pages/lobby_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(
      path: Routes.login.path,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: Routes.lobby.path,
      builder: (BuildContext context, GoRouterState state) {
        final UserMemberEntity userMember = state.extra as UserMemberEntity;
        return LobbyPage(
          userMember: userMember,
        );
      },
    ),
  ],
);
