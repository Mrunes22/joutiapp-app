// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: json['id'] as String,
      annonce: json['annonce'] as String,
      buyer: json['buyer'] as String,
      seller: json['seller'] as String,
      amount: (json['amount'] as num).toDouble(),
      paymentStatus: json['paymentStatus'] as String,
      deliveryStatus: json['deliveryStatus'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'annonce': instance.annonce,
      'buyer': instance.buyer,
      'seller': instance.seller,
      'amount': instance.amount,
      'paymentStatus': instance.paymentStatus,
      'deliveryStatus': instance.deliveryStatus,
      'createdAt': instance.createdAt.toIso8601String(),
    };
