import 'package:ticket_mobile/core/utils/typedefs.dart';
import 'package:ticket_mobile/features/payment/domain/entities/ask_payment_param_entity.dart';
import 'package:ticket_mobile/features/payment/domain/entities/payment_response_entity.dart';
import 'package:ticket_mobile/features/payment/domain/entities/quotamap_response_entity.dart';
import 'package:ticket_mobile/features/payment/domain/entities/transaction_entity.dart';

abstract class PaymentRepository {
  ResultFuture<PaymentResponseEntity> getPayments();

  ResultFuture<QuotaMapResponseEntity> getMapsofpayments();

  ResultFuture<TransactionEntity> askPayment({
    required AskPaymentParamEntity askPaymentParam,
  });
}
