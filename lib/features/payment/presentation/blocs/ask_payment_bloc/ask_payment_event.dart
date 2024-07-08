import 'package:equatable/equatable.dart';
import 'package:ticket_mobile/features/payment/domain/entities/ask_payment_param_entity.dart';

abstract class AskPaymentEvent extends Equatable {}

class AskPaymentRequested extends AskPaymentEvent {
  AskPaymentRequested({
    required this.askPaymentParam,
  });

  final AskPaymentParamEntity askPaymentParam;

  @override
  List<Object> get props => <Object>[
        askPaymentParam,
      ];
}

class AskPaymentResetRequested extends AskPaymentEvent {
  @override
  List<Object> get props => <Object>[];
}
