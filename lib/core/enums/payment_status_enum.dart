enum PaymentStatus {
  active,
  history,
  pending,
  unknown;

  static PaymentStatus fromString(String value) => switch (value) {
        'active' => PaymentStatus.active,
        'history' => PaymentStatus.history,
        'pending' => PaymentStatus.pending,
        _ => PaymentStatus.unknown,
      };
}
