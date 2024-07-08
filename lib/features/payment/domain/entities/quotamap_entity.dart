import 'package:equatable/equatable.dart';

class QuotaMapEntity extends Equatable {
  const QuotaMapEntity({
    required this.fromDate,
    required this.id,
    required this.periodicity,
    required this.price,
    required this.toDate,
  });

  final String fromDate;
  final num id;
  final String periodicity;
  final num price;
  final String toDate;

  @override
  List<Object?> get props => <Object?>[
        fromDate,
        id,
        periodicity,
        price,
        toDate,
      ];
}
