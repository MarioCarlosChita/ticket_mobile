import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_mobile/core/errors/failures.dart';
import 'package:ticket_mobile/features/payment/domain/entities/quotamap_response_entity.dart';
import 'package:ticket_mobile/features/payment/domain/usecases/get_map_sof_payments_use_case.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/get_map_sof_payment_bloc/get_map_sof_payment_event.dart';
import 'package:ticket_mobile/features/payment/presentation/blocs/get_map_sof_payment_bloc/get_map_sof_payment_state.dart';

class GetMapSofPaymentBloc
    extends Bloc<GetMapSofPaymentEvent, GetMapSofPaymentState> {
  GetMapSofPaymentBloc({
    required GetMapSofPaymentUseCase getMapSofPaymentUseCase,
  })  : _getMapSofPaymentUseCase = getMapSofPaymentUseCase,
        super(GetMapSofPaymentInitial()) {
    on<GetMapSofPaymentRequested>(
      _onGetMapSofPaymentRequested,
    );
  }

  final GetMapSofPaymentUseCase _getMapSofPaymentUseCase;

  Future<void> _onGetMapSofPaymentRequested(
    GetMapSofPaymentRequested event,
    Emitter<GetMapSofPaymentState> emit,
  ) async {
    emit(GetMapSofPaymentLoading());

    final result = await _getMapSofPaymentUseCase();
    result.fold(
      (Failure failure) => emit(
        GetMapSofPaymentFailed(
          message: failure.message ?? '',
        ),
      ),
      (QuotaMapResponseEntity data) => emit(
        GetMapSofPaymentSuccess(
          maps: data,
        ),
      ),
    );
  }
}
