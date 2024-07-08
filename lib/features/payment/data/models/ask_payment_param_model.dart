import 'package:ticket_mobile/core/utils/typedefs.dart';
import 'package:ticket_mobile/features/payment/domain/entities/ask_payment_param_entity.dart';

class AskPaymentParamModel extends AskPaymentParamEntity {
  const AskPaymentParamModel({
    required super.memberId,
    required super.paymentType,
    required super.quota,
  });

  DataMap toMap() => <String, dynamic>{
        "memberId": memberId,
        "paymentType": paymentType.name,
        "quota": QuotaParamModel(
          periodicity: quota.periodicity,
          quantity: quota.quantity,
        ).toMap()
      };
}

class QuotaParamModel extends QuotaParamEntity {
  const QuotaParamModel({
    required super.periodicity,
    required super.quantity,
  });

  DataMap toMap() => <String, dynamic>{
        "periodicity": periodicity,
        "quantity": quantity,
      };
}
