import 'package:equatable/equatable.dart';
import 'package:ticket_mobile/features/auth/domain/entity/user_member_entity.dart';

abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => <Object>[];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => <Object>[];
}

class AuthInvalidCredential extends AuthState {
  @override
  List<Object> get props => <Object>[];
}

class AuthSignInSuccess extends AuthState {
  AuthSignInSuccess({
    required this.userMember,
  });

  final UserMemberEntity userMember;

  @override
  List<UserMemberEntity> get props => <UserMemberEntity>[
        userMember,
      ];
}

class AuthSignOutSuccess extends AuthState {
  @override
  List<Object> get props => <Object>[];
}

class AuthFailed extends AuthState {
  AuthFailed({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => <Object>[
        message,
      ];
}
