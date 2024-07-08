import 'package:ticket_mobile/features/auth/domain/entity/sign_in_param_entity.dart';

class SignInParamModel extends SignInParamEntity {
  const SignInParamModel({
    required super.password,
    required super.username,
  });

  Map<String, dynamic> toMap() => <String, dynamic>{
        'username': username,
        'password': password,
      };
}
