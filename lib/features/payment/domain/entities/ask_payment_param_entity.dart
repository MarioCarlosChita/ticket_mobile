import 'package:equatable/equatable.dart';
import 'package:ticket_mobile/core/enums/payment_type_enum.dart';

class AskPaymentParamEntity extends Equatable {
  const AskPaymentParamEntity({
    required this.memberId,
    required this.paymentType,
    required this.quota,
  });

  final num memberId;
  final PaymentType paymentType;
  final QuotaParamEntity quota;

  @override
  List<Object> get props => <Object>[
        memberId,
        paymentType,
        quota,
      ];
}

class QuotaParamEntity extends Equatable {
  const QuotaParamEntity({
    required this.periodicity,
    required this.quantity,
  });

  final String periodicity;
  final num quantity;

  @override
  List<Object?> get props => <Object>[
        periodicity,
        quantity,
      ];
}
