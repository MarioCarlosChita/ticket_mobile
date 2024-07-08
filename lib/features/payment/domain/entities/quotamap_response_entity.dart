import 'package:equatable/equatable.dart';
import 'package:ticket_mobile/features/payment/domain/entities/quotamap_entity.dart';

class QuotaMapResponseEntity extends Equatable {
  const QuotaMapResponseEntity({
    required this.quotamaps,
  });

  final List<QuotaMapEntity> quotamaps;

  @override
  List<Object> get props => <Object>[
        quotamaps,
      ];
}
