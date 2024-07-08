import 'package:ticket_mobile/core/utils/typedefs.dart';
import 'package:ticket_mobile/core/utils/usecases.dart';
import 'package:ticket_mobile/features/payment/domain/entities/payment_response_entity.dart';
import 'package:ticket_mobile/features/payment/domain/repository/payment_repository.dart';

class GetPaymentsUseCase extends UseCaseWithoutParams<PaymentResponseEntity> {
  GetPaymentsUseCase({
    required this.paymentRepository,
  });

  final PaymentRepository paymentRepository;

  @override
  ResultFuture<PaymentResponseEntity> call() async =>
      paymentRepository.getPayments();
}
