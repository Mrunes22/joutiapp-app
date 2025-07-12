
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String email;
  final bool isCertifiedSeller;
  final bool isActive;
  final String? profilePhoto;
  final String? idDocumentName;
  final String? address;
  final String? bankAccount;
  final bool useWafaCash;
  final String kycStatus;
  final DateTime createdAt;

  User({
    required this.id,
    required this.email,
    required this.isCertifiedSeller,
    required this.isActive,
    this.profilePhoto,
    this.idDocumentName,
    this.address,
    this.bankAccount,
    required this.useWafaCash,
    required this.kycStatus,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
