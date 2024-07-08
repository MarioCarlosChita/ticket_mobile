enum HttpClientPath {
  askPayment("/members/transactions"),
  getMapsofpayments("/quotamaps/member"),
  getPayments("/members/quotas"),
  getUserMember("/users/member"),
  login("/sessions/apikey/6d60925b-a048-4d0b-8427-11ffb0014d48");

  const HttpClientPath(
    this.pathName,
  );

  final String pathName;
}
