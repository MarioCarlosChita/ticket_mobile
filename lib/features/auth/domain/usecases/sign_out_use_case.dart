import 'package:ticket_mobile/core/utils/typedefs.dart';
import 'package:ticket_mobile/core/utils/usecases.dart';
import 'package:ticket_mobile/features/auth/domain/repository/auth_repository.dart';

class SignOutUseCase extends UseCaseWithoutParams<bool> {
  SignOutUseCase({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  ResultFuture<bool> call() => authRepository.logout();
}
