import 'package:ticket_mobile/core/utils/typedefs.dart';
import 'package:ticket_mobile/features/payment/domain/entities/transaction_entity.dart';

class TransactionModel extends TransactionEntity {
  const TransactionModel({
    required super.discount,
    required super.discountType,
    required super.id,
    required super.memberId,
    required super.paymentId,
    required super.paymentMbWayNumber,
    required super.paymentOfferTypeId,
    required super.paymentSibsEntity,
    required super.paymentSibsReference,
    required super.paymentType,
    required super.paymentValue,
    required super.paymentWaitTime,
    required super.permanent,
    required super.quota,
    required super.transactionId,
  });

  factory TransactionModel.fromJson(DataMap json) {
    return TransactionModel(
      discount: json['discount'] as String? ?? '',
      discountType: json['discountType'] as String? ?? '',
      id: json['id'] as num? ?? 0,
      memberId: json['memberId'] as num? ?? 0,
      paymentId: json['paymentId'] as num? ?? 0,
      paymentMbWayNumber: json['paymentMbWayNumber'] as String? ?? '',
      paymentOfferTypeId: json['paymentOfferTypeId'] as String? ?? '',
      paymentSibsEntity: json['paymentSibsEntity'] as String? ?? '',
      paymentSibsReference: json['paymentSibsReference'] as String? ?? '',
      paymentType: json['paymentType'] as String? ?? '',
      paymentValue: json['paymentValue'] as num? ?? 0,
      paymentWaitTime: json['paymentWaitTime'] as num? ?? 0,
      permanent: json['permanent'] as bool? ?? false,
      quota: QuotaModel.fromJson(json['quota'] as DataMap),
      transactionId: json['transactionId'] as String? ?? '',
    );
  }

  @override
  List<Object> get props => <Object>[
        discount,
        discountType,
        id,
        memberId,
        paymentId,
        paymentMbWayNumber,
        paymentOfferTypeId,
        paymentSibsEntity,
        paymentSibsReference,
        paymentType,
        paymentValue,
        paymentWaitTime,
        permanent,
        quota,
        transactionId,
      ];
}

class QuotaModel extends QuotaEntity {
  const QuotaModel({
    required super.startDate,
    required super.quantity,
    required super.periodicity,
    required super.quotaPeriods,
    required super.quotaPaymentValue,
    required super.periods,
  });

  factory QuotaModel.fromJson(DataMap json) {
    return QuotaModel(
      startDate: json['startDate'] as String? ?? '',
      quantity: json['quantity'] as num? ?? 0,
      periodicity: json['periodicity'] as String? ?? '',
      quotaPeriods: json['quotaPeriods'] != null &&
              json['quotaPeriods'] is List<dynamic>
          ? List.from(
              (json['quotaPeriods'] as List<dynamic>).map(
                (quotaPeriod) => PeriodModel.fromJson(quotaPeriod as DataMap),
              ),
            )
          : [],
      quotaPaymentValue: json['quotaPaymentValue'] as num? ?? 0,
      periods: json['periods'] != null && json['periods'] is List<dynamic>
          ? List.from(
              (json['periods'] as List<dynamic>).map(
                (quotaPeriod) => PeriodModel.fromJson(quotaPeriod as DataMap),
              ),
            )
          : [],
    );
  }

  @override
  List<Object> get props => <Object>[
        startDate,
        quantity,
        periodicity,
        quotaPeriods,
        quotaPaymentValue,
        periods,
      ];
}

class PeriodModel extends PeriodEntity {
  const PeriodModel({
    required super.id,
    required super.memberTransactionId,
    required super.periodStart,
    required super.periodEnd,
    required super.mapPrice,
    required super.price,
  });

  factory PeriodModel.fromJson(DataMap json) {
    return PeriodModel(
      id: json['id'] as num? ?? 0,
      memberTransactionId: json['memberTransactionId'] as num? ?? 0,
      periodStart: json['periodStart'] as String? ?? '',
      periodEnd: json['periodEnd'] as String? ?? '',
      mapPrice: json['mapPrice'] as num? ?? 0,
      price: json['price'] as num? ?? 0,
    );
  }

  @override
  List<Object> get props => <Object>[
        id,
        memberTransactionId,
        periodStart,
        periodEnd,
        mapPrice,
        price,
      ];
}
