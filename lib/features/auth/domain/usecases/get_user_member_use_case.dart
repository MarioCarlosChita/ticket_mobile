import 'package:ticket_mobile/core/utils/typedefs.dart';
import 'package:ticket_mobile/core/utils/usecases.dart';
import 'package:ticket_mobile/features/auth/domain/entity/user_member_entity.dart';
import 'package:ticket_mobile/features/auth/domain/repository/auth_repository.dart';

class GetUserMemberUseCase extends UseCaseWithoutParams<UserMemberEntity> {
  GetUserMemberUseCase({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  ResultFuture<UserMemberEntity> call() => authRepository.getUserMember();
}
