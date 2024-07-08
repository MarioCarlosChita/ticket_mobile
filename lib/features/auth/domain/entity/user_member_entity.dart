import 'package:equatable/equatable.dart';

class UserMemberEntity extends Equatable {
  const UserMemberEntity({
    required this.active,
    required this.address,
    required this.askedAssociation,
    required this.birthDate,
    required this.cardName,
    required this.city,
    required this.code,
    required this.country,
    required this.customerTaxNumber,
    required this.email,
    required this.gender,
    required this.id,
    required this.idNumber,
    required this.imageFilename,
    required this.inactivationMotive,
    required this.memberCategoryId,
    required this.mobile,
    required this.name,
    required this.oldNumber,
    required this.passport,
    required this.phone,
    required this.postalcode,
    required this.sinceDate,
    required this.status,
    required this.ticketTypes,
    required this.type,
    required this.untilDate,
  });

  final bool active;
  final String address;
  final bool askedAssociation;
  final String birthDate;
  final String cardName;
  final String city;
  final String code;
  final String country;
  final String customerTaxNumber;
  final String email;
  final String gender;
  final num id;
  final num idNumber;
  final String imageFilename;
  final String inactivationMotive;
  final num memberCategoryId;
  final String mobile;
  final String name;
  final String oldNumber;
  final String passport;
  final dynamic phone;
  final String postalcode;
  final String sinceDate;
  final String status;
  final List<dynamic> ticketTypes;
  final String type;
  final String untilDate;

  @override
  List<Object> get props => <Object>[
        active,
        address,
        askedAssociation,
        birthDate,
        cardName,
        city,
        code,
        country,
        customerTaxNumber,
        email,
        gender,
        id,
        idNumber,
        imageFilename,
        inactivationMotive,
        memberCategoryId,
        mobile,
        name,
        oldNumber,
        passport,
        phone,
        postalcode,
        sinceDate,
        status,
        ticketTypes,
        type,
        untilDate,
      ];
}
