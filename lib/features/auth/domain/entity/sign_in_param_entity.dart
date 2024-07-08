import 'package:equatable/equatable.dart';

class SignInParamEntity extends Equatable {
  const SignInParamEntity({
    required this.password,
    required this.username,
  });

  final String password;
  final String username;

  @override
  List<String> get props => <String>[
        password,
        username,
      ];
}
