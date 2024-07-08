import 'package:equatable/equatable.dart';
import 'package:ticket_mobile/features/payment/domain/entities/payment_response_entity.dart';

abstract class GetPaymentState extends Equatable {}

class GetPaymentInitial extends GetPaymentState {
  @override
  List<Object> get props => <Object>[];
}

class GetPaymentLoading extends GetPaymentState {
  @override
  List<Object> get props => <Object>[];
}

class GetPaymentSuccess extends GetPaymentState {
  GetPaymentSuccess({
    required this.paymentResponse,
  });

  final PaymentResponseEntity paymentResponse;

  @override
  List<Object> get props => <Object>[
        paymentResponse,
      ];
}

class GetPaymentFailed extends GetPaymentState {
  GetPaymentFailed({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => <Object>[
        message,
      ];
}
