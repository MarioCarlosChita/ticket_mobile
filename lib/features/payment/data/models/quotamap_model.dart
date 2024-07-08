import 'package:ticket_mobile/core/utils/typedefs.dart';
import 'package:ticket_mobile/features/payment/domain/entities/quotamap_entity.dart';

class QuotaMapModel extends QuotaMapEntity {
  const QuotaMapModel({
    required super.fromDate,
    required super.id,
    required super.periodicity,
    required super.price,
    required super.toDate,
  });

  factory QuotaMapModel.fromJson(DataMap json) {
    return QuotaMapModel(
      id: json['id'] as num? ?? 0,
      fromDate: json['fromDate'] as String? ?? '',
      periodicity: json['periodicity'] as String? ?? '',
      price: json['price'] as num? ?? 0,
      toDate: json['toDate'] as String? ?? '',
    );
  }
}
