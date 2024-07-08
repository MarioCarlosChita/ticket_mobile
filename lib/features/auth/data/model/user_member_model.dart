import 'package:ticket_mobile/core/utils/typedefs.dart';
import 'package:ticket_mobile/features/auth/domain/entity/user_member_entity.dart';

class UserMemberModel extends UserMemberEntity {
  const UserMemberModel({
    required super.active,
    required super.address,
    required super.askedAssociation,
    required super.birthDate,
    required super.cardName,
    required super.city,
    required super.code,
    required super.country,
    required super.customerTaxNumber,
    required super.email,
    required super.gender,
    required super.id,
    required super.idNumber,
    required super.imageFilename,
    required super.inactivationMotive,
    required super.memberCategoryId,
    required super.mobile,
    required super.name,
    required super.oldNumber,
    required super.passport,
    required super.phone,
    required super.postalcode,
    required super.sinceDate,
    required super.status,
    required super.ticketTypes,
    required super.type,
    required super.untilDate,
  });

  factory UserMemberModel.fromJson(DataMap json) {
    return UserMemberModel(
      id: json['id'] as num? ?? 0,
      active: json['active'] as bool? ?? false,
      address: json['address'] as String? ?? '',
      askedAssociation: json['askedAssociation'] as bool? ?? false,
      birthDate: json['birthDate'] as String? ?? '',
      cardName: json['cardName'] as String? ?? '',
      city: json['city'] as String? ?? '',
      code: json['code'] as String? ?? '',
      country: json['country'] as String? ?? '',
      customerTaxNumber: json['customerTaxNumber'] as String? ?? '',
      email: json['email'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      idNumber: json['idNumber'] as num? ?? 0,
      imageFilename: json['imageFilename'] as String? ?? '',
      inactivationMotive: json['inactivationMotive'] as String? ?? '',
      memberCategoryId: json['memberCategoryId'] as num? ?? 0,
      mobile: json['mobile'] as String? ?? '',
      name: json['name'] as String? ?? '',
      oldNumber: json['oldNumber'] as String? ?? '',
      passport: json['passport'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      postalcode: json['postalcode'] as String? ?? '',
      untilDate: json['untilDate'] as String? ?? '',
      sinceDate: json['sinceDate'] as String? ?? '',
      status: json['status'] as String? ?? '',
      ticketTypes: json['ticketTypes'] as List<dynamic>? ?? <dynamic>[],
      type: json['type'] as String? ?? '',
    );
  }
}
