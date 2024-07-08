import 'package:ticket_mobile/core/utils/typedefs.dart';
import 'package:ticket_mobile/core/utils/usecases.dart';
import 'package:ticket_mobile/features/auth/domain/entity/sign_in_param_entity.dart';
import 'package:ticket_mobile/features/auth/domain/repository/auth_repository.dart';

class SignInUseCase extends UseCaseWithParams<bool, SignInParamEntity> {
  SignInUseCase({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  ResultFuture<bool> call(
    SignInParamEntity params,
  ) =>
      authRepository.login(
        signInParam: params,
      );
}
