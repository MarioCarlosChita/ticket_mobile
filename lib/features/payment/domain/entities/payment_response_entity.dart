import 'package:equatable/equatable.dart';
import 'package:ticket_mobile/features/payment/domain/entities/payment_entity.dart';

class PaymentResponseEntity extends Equatable {
  const PaymentResponseEntity({
    required this.payments,
  });

  final List<PaymentEntity> payments;

  @override
  List<List<PaymentEntity>> get props => <List<PaymentEntity>>[
        payments,
      ];
}
