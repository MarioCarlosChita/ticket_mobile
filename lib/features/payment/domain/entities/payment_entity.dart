import 'package:equatable/equatable.dart';
import 'package:ticket_mobile/core/enums/payment_status_enum.dart';
import 'package:ticket_mobile/core/enums/payment_type_enum.dart';

class PaymentEntity extends Equatable {
  const PaymentEntity({
    required this.datetime,
    required this.id,
    required this.invoiceId,
    required this.invoiceNumber,
    required this.mapPrice,
    required this.name,
    required this.paymentDatetime,
    required this.paymentId,
    required this.paymentType,
    required this.periodEnd,
    required this.periodStart,
    required this.permanent,
    required this.permanentDatetime,
    required this.quantity,
    required this.returnInvoiceId,
    required this.returnInvoiceNumber,
    required this.returnTaxInvoiceId,
    required this.returnTaxInvoiceNumber,
    required this.skipInvoice,
    required this.status,
    required this.taxInvoiceId,
    required this.taxInvoiceNumber,
    required this.total,
  });

  final String datetime;
  final num id;
  final String invoiceId;
  final String invoiceNumber;
  final num mapPrice;
  final String name;
  final String paymentDatetime;
  final num paymentId;
  final PaymentType paymentType;
  final String periodEnd;
  final String periodStart;
  final bool permanent;
  final String permanentDatetime;
  final num quantity;
  final String returnInvoiceId;
  final String returnInvoiceNumber;
  final String returnTaxInvoiceId;
  final String returnTaxInvoiceNumber;
  final bool skipInvoice;
  final PaymentStatus status;
  final String taxInvoiceId;
  final String taxInvoiceNumber;
  final num total;

  @override
  List<Object> get props => <Object>[
        datetime,
        id,
        invoiceId,
        invoiceNumber,
        mapPrice,
        name,
        paymentDatetime,
        paymentType,
        periodEnd,
        periodStart,
        permanent,
        permanentDatetime,
        paymentId,
        quantity,
        returnInvoiceId,
        returnInvoiceNumber,
        returnTaxInvoiceId,
        returnTaxInvoiceNumber,
        skipInvoice,
        status,
        taxInvoiceId,
        taxInvoiceNumber,
        total,
      ];
}
