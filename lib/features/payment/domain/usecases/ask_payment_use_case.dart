import 'package:ticket_mobile/core/utils/typedefs.dart';
import 'package:ticket_mobile/core/utils/usecases.dart';
import 'package:ticket_mobile/features/payment/domain/entities/ask_payment_param_entity.dart';
import 'package:ticket_mobile/features/payment/domain/entities/transaction_entity.dart';
import 'package:ticket_mobile/features/payment/domain/repository/payment_repository.dart';

class AskPaymentUseCase
    extends UseCaseWithParams<TransactionEntity, AskPaymentParamEntity> {
  AskPaymentUseCase({
    required this.paymentRepository,
  });

  final PaymentRepository paymentRepository;

  @override
  ResultFuture<TransactionEntity> call(AskPaymentParamEntity params) =>
      paymentRepository.askPayment(
        askPaymentParam: params,
      );
}
