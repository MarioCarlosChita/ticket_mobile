import 'package:ticket_mobile/core/errors/failures.dart';
import 'package:ticket_mobile/features/auth/domain/entity/user_member_entity.dart';
import 'package:ticket_mobile/features/auth/domain/usecases/get_user_member_use_case.dart';
import 'package:ticket_mobile/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:ticket_mobile/features/auth/domain/usecases/sign_out_use_case.dart';
import 'package:ticket_mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:ticket_mobile/features/auth/presentation/bloc/auth_state.dart';
import 'package:bloc/bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required GetUserMemberUseCase getUserMemberUseCase,
    required SignInUseCase signInUseCase,
    required SignOutUseCase signOutUseCase,
  })  : _getUserMemberUseCase = getUserMemberUseCase,
        _signInUseCase = signInUseCase,
        _signOutUseCase = signOutUseCase,
        super(AuthInitial()) {
    on<AuthSignInRequested>(_onAuthSignInRequested);
    on<AuthUserMemberRequested>(_onAuthUserMemberRequested);
    on<AuthSignOutRequested>(_onAuthSignOutRequested);
  }

  final GetUserMemberUseCase _getUserMemberUseCase;
  final SignInUseCase _signInUseCase;
  final SignOutUseCase _signOutUseCase;

  UserMemberEntity? userMember;

  Future<void> _onAuthSignInRequested(
    AuthSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await _signInUseCase(
      event.signInParam,
    );

    result.fold(
      (Failure failure) {
        if (failure is InvalidUserCredentialFailure) {
          emit(
            AuthInvalidCredential(),
          );
        } else {
          emit(
            AuthFailed(
              message: failure.message ?? '',
            ),
          );
        }
      },
      (status) {
        add(AuthUserMemberRequested());
      },
    );
  }

  Future<void> _onAuthUserMemberRequested(
    AuthUserMemberRequested event,
    Emitter<AuthState> emit,
  ) async {
    final requestUserMember = await _getUserMemberUseCase();
    requestUserMember.fold(
      (Failure failure) => emit(
        AuthFailed(
          message: failure.message ?? '',
        ),
      ),
      (UserMemberEntity data) {
        userMember = data;
        emit(
          AuthSignInSuccess(
            userMember: data,
          ),
        );
      },
    );
  }

  Future<void> _onAuthSignOutRequested(
    AuthSignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _signOutUseCase();
    result.fold(
      (Failure failure) => emit(
        AuthFailed(message: failure.message ?? ''),
      ),
      (status) => emit(
        AuthSignOutSuccess(),
      ),
    );
  }
}
