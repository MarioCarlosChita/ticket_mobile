import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_mobile/core/errors/failures.dart';
import 'package:ticket_mobile/features/payment/domain/entities/transaction_entity.dart';
import 'package:ticket_mobile/features/payment/domain/usecases/ask_payment_use_case.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/ask_payment_bloc/ask_payment_event.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/ask_payment_bloc/ask_payment_state.dart';

class AskPaymentBloc extends Bloc<AskPaymentEvent, AskPaymentState> {
  AskPaymentBloc({
    required AskPaymentUseCase askPaymentUseCase,
  })  : _askPaymentUseCase = askPaymentUseCase,
        super(AskPaymentInitial()) {
    on<AskPaymentRequested>(_onAskPaymentRequested);
    on<AskPaymentResetRequested>(_onAskPaymentResetRequested);
  }

  final AskPaymentUseCase _askPaymentUseCase;

  _onAskPaymentRequested(
    AskPaymentRequested event,
    Emitter<AskPaymentState> emit,
  ) async {
    emit(AskPaymentLoading());
    final result = await _askPaymentUseCase(
      event.askPaymentParam,
    );

    result.fold(
      (Failure failure) => emit(
        AskPaymentFailed(message: failure.message ?? ''),
      ),
      (TransactionEntity data) => emit(
        AskPaymentSuccess(),
      ),
    );
  }

  void _onAskPaymentResetRequested(
    AskPaymentResetRequested event,
    Emitter<AskPaymentState> emit,
  ) {
    emit(AskPaymentInitial());
  }
}
