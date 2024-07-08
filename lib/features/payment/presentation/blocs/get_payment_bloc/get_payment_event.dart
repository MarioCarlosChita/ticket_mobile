import 'package:equatable/equatable.dart';

abstract class GetPaymentEvent extends Equatable {}

class GetPaymentRequested extends GetPaymentEvent {
  @override
  List<Object> get props => <Object>[];
}
