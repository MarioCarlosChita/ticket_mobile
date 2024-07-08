import 'package:ticket_mobile/features/payment/data/models/quotamap_model.dart';
import 'package:ticket_mobile/features/payment/domain/entities/quotamap_response_entity.dart';

class QuotaMapResponseModel extends QuotaMapResponseEntity {
  const QuotaMapResponseModel({
    required super.quotamaps,
  });

  factory QuotaMapResponseModel.fromJson(List<dynamic> data) {
    return QuotaMapResponseModel(
      quotamaps: List.from(
        data.map(
          (mapsofpayment) => QuotaMapModel.fromJson(
            mapsofpayment,
          ),
        ),
      ),
    );
  }
}
