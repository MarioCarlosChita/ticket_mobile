import 'package:ticket_mobile/core/enums/payment_status_enum.dart';
import 'package:ticket_mobile/core/enums/payment_type_enum.dart';
import 'package:ticket_mobile/core/utils/typedefs.dart';
import 'package:ticket_mobile/features/payment/domain/entities/payment_entity.dart';

class PaymentModel extends PaymentEntity {
  const PaymentModel({
    required super.datetime,
    required super.id,
    required super.invoiceId,
    required super.invoiceNumber,
    required super.mapPrice,
    required super.name,
    required super.paymentDatetime,
    required super.paymentId,
    required super.paymentType,
    required super.periodEnd,
    required super.periodStart,
    required super.permanent,
    required super.permanentDatetime,
    required super.quantity,
    required super.returnInvoiceId,
    required super.returnInvoiceNumber,
    required super.returnTaxInvoiceId,
    required super.returnTaxInvoiceNumber,
    required super.skipInvoice,
    required super.status,
    required super.taxInvoiceId,
    required super.taxInvoiceNumber,
    required super.total,
  });

  factory PaymentModel.fromJson(DataMap json) => PaymentModel(
        datetime: json['datetime'] as String? ?? '',
        id: json['id'] as num? ?? 0,
        invoiceId: json['invoiceId'] as String? ?? '',
        invoiceNumber: json['invoiceNumber'] as String? ?? '',
        mapPrice: json['mapPrice'] as num? ?? 0,
        name: json['name'] as String? ?? '',
        paymentDatetime: json['paymentDatetime'] as String? ?? '',
        paymentId: json['paymentId'] as num? ?? 0,
        paymentType:
            PaymentType.fromString(json['paymentType'] as String? ?? ''),
        periodEnd: json['periodEnd'] as String? ?? '',
        periodStart: json['periodStart'] as String? ?? '',
        permanent: json['permanent'] as bool? ?? false,
        permanentDatetime: json['permanentDatetime'] as String? ?? '',
        quantity: json['quantity'] as num? ?? 0,
        returnInvoiceId: json['returnInvoiceId'] as String? ?? '',
        returnInvoiceNumber: json['returnInvoiceNumber'] as String? ?? '',
        returnTaxInvoiceId: json['returnTaxInvoiceId'] as String? ?? '',
        returnTaxInvoiceNumber: json['returnTaxInvoiceNumber'] as String? ?? '',
        skipInvoice: json['skipInvoice'] as bool? ?? false,
        status: PaymentStatus.fromString(json['status'] as String? ?? ''),
        taxInvoiceId: json['taxInvoiceId'] as String? ?? '',
        taxInvoiceNumber: json['taxInvoiceNumber'] as String? ?? '',
        total: json['total'] as num? ?? 0,
      );
}
