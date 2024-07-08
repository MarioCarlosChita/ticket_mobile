import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_mobile/core/errors/failures.dart';
import 'package:ticket_mobile/features/payment/domain/entities/payment_response_entity.dart';
import 'package:ticket_mobile/features/payment/domain/usecases/get_payments_use_case.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/get_payment_bloc/get_payment_event.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/get_payment_bloc/get_payment_state.dart';

class GetPaymentBloc extends Bloc<GetPaymentEvent, GetPaymentState> {
  GetPaymentBloc({required GetPaymentsUseCase getPaymentsUseCase})
      : _getPaymentsUseCase = getPaymentsUseCase,
        super(GetPaymentInitial()) {
    on<GetPaymentRequested>(
      _onGetPaymentRequested,
    );
  }

  final GetPaymentsUseCase _getPaymentsUseCase;

  void _onGetPaymentRequested(
    GetPaymentRequested event,
    Emitter<GetPaymentState> emit,
  ) async {
    emit(GetPaymentLoading());

    final result = await _getPaymentsUseCase();

    result.fold(
      (Failure failure) => emit(
        GetPaymentFailed(
          message: failure.message ?? '',
        ),
      ),
      (PaymentResponseEntity data) {
        emit(
          GetPaymentSuccess(
            paymentResponse: data,
          ),
        );
      },
    );
  }
}
