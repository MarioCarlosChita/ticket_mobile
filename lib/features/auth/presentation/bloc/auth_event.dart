import 'package:equatable/equatable.dart';
import 'package:ticket_mobile/features/auth/domain/entity/sign_in_param_entity.dart';

abstract class AuthEvent extends Equatable {}

class AuthSignInRequested extends AuthEvent {
  AuthSignInRequested({
    required this.signInParam,
  });

  final SignInParamEntity signInParam;

  @override
  List<Object> get props => <Object>[
        signInParam,
      ];
}

class AuthUserMemberRequested extends AuthEvent {
  AuthUserMemberRequested();
  @override
  List<Object> get props => <Object>[];
}

class AuthSignOutRequested extends AuthEvent {
  AuthSignOutRequested();

  @override
  List<Object> get props => <Object>[];
}
