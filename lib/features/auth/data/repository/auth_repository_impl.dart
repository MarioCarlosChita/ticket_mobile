import 'package:dartz/dartz.dart';
import 'package:ticket_mobile/core/errors/failures.dart';
import 'package:ticket_mobile/core/utils/typedefs.dart';
import 'package:ticket_mobile/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:ticket_mobile/features/auth/data/model/sign_in_param_model.dart';
import 'package:ticket_mobile/features/auth/data/model/user_member_model.dart';
import 'package:ticket_mobile/features/auth/domain/entity/sign_in_param_entity.dart';
import 'package:ticket_mobile/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.authRemoteDataSource,
  });

  final AuthRemoteDataSource authRemoteDataSource;

  @override
  ResultFuture<bool> login({
    required SignInParamEntity signInParam,
  }) async {
    try {
      final response = await authRemoteDataSource.login(
        signInParam: SignInParamModel(
          password: signInParam.password,
          username: signInParam.username,
        ),
      );
      return Right(response);
    } on Exception catch (exception) {
      return handleRepositoryException(
        exception,
        'login',
      );
    }
  }

  @override
  ResultFuture<bool> logout() async {
    try {
      final response = await authRemoteDataSource.logout();
      return Right(response);
    } on Exception catch (exception) {
      return handleRepositoryException(
        exception,
        'logout',
      );
    }
  }

  @override
  ResultFuture<UserMemberModel> getUserMember() async {
    try {
      final response = await authRemoteDataSource.getUserMember();
      return Right(response);
    } on Exception catch (exception) {
      return handleRepositoryException(
        exception,
        'getUserMember',
      );
    }
  }
}
