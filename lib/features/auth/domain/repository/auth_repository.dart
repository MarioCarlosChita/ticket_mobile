import 'package:ticket_mobile/core/utils/typedefs.dart';
import 'package:ticket_mobile/features/auth/data/model/user_member_model.dart';
import 'package:ticket_mobile/features/auth/domain/entity/sign_in_param_entity.dart';

abstract class AuthRepository {
  ResultFuture<UserMemberModel> getUserMember();

  ResultFuture<bool> login({
    required SignInParamEntity signInParam,
  });

  ResultFuture<bool> logout();
}
