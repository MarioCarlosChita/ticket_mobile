enum PaymentType {
  cash,
  mbref,
  mbway,
  mb,
  offer,
  paypal,
  stripe,
  unknown;

  static PaymentType fromString(String value) => switch (value) {
        'cash' => PaymentType.cash,
        'mbref' => PaymentType.mbref,
        'mb' => PaymentType.mb,
        'mbway' => PaymentType.mbway,
        'offer' => PaymentType.offer,
        'paypal' => PaymentType.paypal,
        'stripe' => PaymentType.stripe,
        _ => PaymentType.unknown,
      };
}
