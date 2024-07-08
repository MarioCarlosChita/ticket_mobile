import 'package:equatable/equatable.dart';

abstract class AskPaymentState extends Equatable {}

class AskPaymentInitial extends AskPaymentState {
  @override
  List<Object?> get props => <Object>[];
}

class AskPaymentLoading extends AskPaymentState {
  @override
  List<Object> get props => <Object>[];
}

class AskPaymentFailed extends AskPaymentState {
  AskPaymentFailed({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => <Object>[
        message,
      ];
}

class AskPaymentSuccess extends AskPaymentState {
  @override
  List<Object> get props => <Object>[];
}
