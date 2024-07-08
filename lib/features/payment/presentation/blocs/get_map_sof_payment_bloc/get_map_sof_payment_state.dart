import 'package:equatable/equatable.dart';
import 'package:ticket_mobile/features/payment/domain/entities/quotamap_response_entity.dart';

abstract class GetMapSofPaymentState extends Equatable {}

class GetMapSofPaymentInitial extends GetMapSofPaymentState {
  @override
  List<Object> get props => <Object>[];
}

class GetMapSofPaymentLoading extends GetMapSofPaymentState {
  @override
  List<Object> get props => <Object>[];
}

class GetMapSofPaymentFailed extends GetMapSofPaymentState {
  GetMapSofPaymentFailed({
    required this.message,
  });
  final String message;

  @override
  List<Object?> get props => <Object>[
        message,
      ];
}

class GetMapSofPaymentSuccess extends GetMapSofPaymentState {
  GetMapSofPaymentSuccess({
    required this.maps,
  });

  final QuotaMapResponseEntity maps;
  @override
  List<Object> get props => <Object>[
        maps,
      ];
}
