import 'package:ticket_mobile/core/utils/typedefs.dart';
import 'package:ticket_mobile/features/payment/data/models/payment_model.dart';
import 'package:ticket_mobile/features/payment/domain/entities/payment_response_entity.dart';

class PaymentResponseModel extends PaymentResponseEntity {
  const PaymentResponseModel({
    required super.payments,
  });

  factory PaymentResponseModel.fromJson(List<dynamic> payments) {
    return PaymentResponseModel(
      payments: List.from(
        payments.map(
          (payment) => PaymentModel.fromJson(payment as DataMap),
        ),
      ),
    );
  }
}
