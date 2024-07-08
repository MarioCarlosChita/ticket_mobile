import 'package:dartz/dartz.dart';
import 'package:ticket_mobile/core/errors/failures.dart';
import 'package:ticket_mobile/core/utils/typedefs.dart';
import 'package:ticket_mobile/features/payment/data/data_source/payment_remote_data_source.dart';
import 'package:ticket_mobile/features/payment/data/models/ask_payment_param_model.dart';
import 'package:ticket_mobile/features/payment/domain/entities/ask_payment_param_entity.dart';
import 'package:ticket_mobile/features/payment/domain/entities/payment_response_entity.dart';
import 'package:ticket_mobile/features/payment/domain/entities/quotamap_response_entity.dart';
import 'package:ticket_mobile/features/payment/domain/entities/transaction_entity.dart';
import 'package:ticket_mobile/features/payment/domain/repository/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  PaymentRepositoryImpl({
    required this.paymentRemoteDataSource,
  });

  final PaymentRemoteDataSource paymentRemoteDataSource;

  @override
  ResultFuture<TransactionEntity> askPayment({
    required AskPaymentParamEntity askPaymentParam,
  }) async {
    try {
      final transactions = await paymentRemoteDataSource.askPayment(
        askPaymentParam: AskPaymentParamModel(
          memberId: askPaymentParam.memberId,
          paymentType: askPaymentParam.paymentType,
          quota: askPaymentParam.quota,
        ),
      );
      return Right(transactions);
    } on Exception catch (exception) {
      return handleRepositoryException(
        exception,
        'askPayment',
      );
    }
  }

  @override
  ResultFuture<QuotaMapResponseEntity> getMapsofpayments() async {
    try {
      final quotas = await paymentRemoteDataSource.getMapsofpayments();
      return Right(quotas);
    } on Exception catch (exception) {
      return handleRepositoryException(
        exception,
        'getMapsofpayments',
      );
    }
  }

  @override
  ResultFuture<PaymentResponseEntity> getPayments() async {
    try {
      final payments = await paymentRemoteDataSource.getPayments();
      return Right(payments);
    } on Exception catch (exception) {
      return handleRepositoryException(
        exception,
        'getPayments',
      );
    }
  }
}
