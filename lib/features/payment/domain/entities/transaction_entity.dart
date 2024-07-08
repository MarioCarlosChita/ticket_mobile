import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  const TransactionEntity({
    required this.discount,
    required this.discountType,
    required this.id,
    required this.memberId,
    required this.paymentId,
    required this.paymentMbWayNumber,
    required this.paymentOfferTypeId,
    required this.paymentSibsEntity,
    required this.paymentSibsReference,
    required this.paymentType,
    required this.paymentValue,
    required this.paymentWaitTime,
    required this.permanent,
    required this.quota,
    required this.transactionId,
  });

  final String discount;
  final String discountType;
  final num id;
  final num memberId;
  final num paymentId;
  final String paymentMbWayNumber;
  final String paymentOfferTypeId;
  final String paymentSibsEntity;
  final String paymentSibsReference;
  final String paymentType;
  final num paymentValue;
  final num paymentWaitTime;
  final bool permanent;
  final QuotaEntity quota;
  final String transactionId;

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

class QuotaEntity extends Equatable {
  const QuotaEntity({
    required this.startDate,
    required this.quantity,
    required this.periodicity,
    required this.quotaPeriods,
    required this.quotaPaymentValue,
    required this.periods,
  });

  final String startDate;
  final num quantity;
  final String periodicity;
  final List<PeriodEntity> quotaPeriods;
  final num quotaPaymentValue;
  final List<PeriodEntity> periods;

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

class PeriodEntity extends Equatable {
  const PeriodEntity({
    required this.id,
    required this.memberTransactionId,
    required this.periodStart,
    required this.periodEnd,
    required this.mapPrice,
    required this.price,
  });

  final num id;
  final num memberTransactionId;
  final String periodStart;
  final String periodEnd;
  final num mapPrice;
  final num price;

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
