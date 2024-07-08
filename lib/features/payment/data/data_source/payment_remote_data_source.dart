import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ticket_mobile/core/enums/http_client_path_enum.dart';
import 'package:ticket_mobile/core/errors/exceptions.dart';
import 'package:ticket_mobile/core/network/app_http_client.dart';
import 'package:ticket_mobile/core/utils/typedefs.dart';
import 'package:ticket_mobile/features/payment/data/models/payment_response_model.dart';
import 'package:ticket_mobile/features/payment/data/models/quotamap_response_model.dart';
import 'package:ticket_mobile/features/payment/data/models/transaction_model.dart';
import 'package:ticket_mobile/features/payment/data/models/ask_payment_param_model.dart';

abstract class PaymentRemoteDataSource {
  Future<PaymentResponseModel> getPayments();

  Future<QuotaMapResponseModel> getMapsofpayments();

  Future<TransactionModel> askPayment({
    required AskPaymentParamModel askPaymentParam,
  });
}

class PaymentRemoteDataSourceImpl extends PaymentRemoteDataSource {
  PaymentRemoteDataSourceImpl({
    required this.httpClient,
  });

  final AppHttpClient httpClient;

  @override
  Future<TransactionModel> askPayment({
    required AskPaymentParamModel askPaymentParam,
  }) async {
    try {
      final Response response = await httpClient.post(
        path: HttpClientPath.askPayment.pathName,
        data: askPaymentParam.toMap(),
      );

      if (response.statusCode == HttpStatus.created ||
          response.statusCode == HttpStatus.ok) {
        final DataMap responseData = response.data as DataMap;
        return TransactionModel.fromJson(responseData);
      } else {
        throw ServerException(
          message: response.statusMessage,
          statusCode: response.statusCode,
        );
      }
    } catch (exception) {
      throw handleDataSourceException(
        exception,
        'askPayment',
      );
    }
  }

  @override
  Future<PaymentResponseModel> getPayments() async {
    try {
      final Response response = await httpClient.get(
        path: HttpClientPath.getPayments.pathName,
      );

      if (response.statusCode == HttpStatus.ok) {
        final List<dynamic> payments = response.data;
        return PaymentResponseModel.fromJson(payments);
      } else {
        throw ServerException(
          message: response.statusMessage,
          statusCode: response.statusCode,
        );
      }
    } catch (exception) {
      throw handleDataSourceException(
        exception,
        'getPayments',
      );
    }
  }

  @override
  Future<QuotaMapResponseModel> getMapsofpayments() async {
    try {
      final Response response = await httpClient.get(
        path: HttpClientPath.getMapsofpayments.pathName,
      );

      if (response.statusCode == HttpStatus.ok) {
        final List<dynamic> quotas = response.data as List<dynamic>;
        return QuotaMapResponseModel.fromJson(quotas);
      } else {
        throw ServerException(
          message: response.statusMessage,
          statusCode: response.statusCode,
        );
      }
    } catch (exception) {
      throw handleDataSourceException(
        exception,
        'getMapsofpayments',
      );
    }
  }
}
