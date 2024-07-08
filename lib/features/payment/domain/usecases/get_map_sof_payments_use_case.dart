import 'package:ticket_mobile/core/utils/typedefs.dart';
import 'package:ticket_mobile/core/utils/usecases.dart';
import 'package:ticket_mobile/features/payment/domain/entities/quotamap_response_entity.dart';
import 'package:ticket_mobile/features/payment/domain/repository/payment_repository.dart';

class GetMapSofPaymentUseCase
    extends UseCaseWithoutParams<QuotaMapResponseEntity> {
  GetMapSofPaymentUseCase({
    required this.paymentRepository,
  });

  final PaymentRepository paymentRepository;

  @override
  ResultFuture<QuotaMapResponseEntity> call() =>
      paymentRepository.getMapsofpayments();
}
