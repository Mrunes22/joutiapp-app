// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      email: json['email'] as String,
      isCertifiedSeller: json['isCertifiedSeller'] as bool,
      isActive: json['isActive'] as bool,
      profilePhoto: json['profilePhoto'] as String?,
      idDocumentName: json['idDocumentName'] as String?,
      address: json['address'] as String?,
      bankAccount: json['bankAccount'] as String?,
      useWafaCash: json['useWafaCash'] as bool,
      kycStatus: json['kycStatus'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'isCertifiedSeller': instance.isCertifiedSeller,
      'isActive': instance.isActive,
      'profilePhoto': instance.profilePhoto,
      'idDocumentName': instance.idDocumentName,
      'address': instance.address,
      'bankAccount': instance.bankAccount,
      'useWafaCash': instance.useWafaCash,
      'kycStatus': instance.kycStatus,
      'createdAt': instance.createdAt.toIso8601String(),
    };
