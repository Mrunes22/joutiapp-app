
import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  final String id;
  final String annonce;
  final String buyer;
  final String seller;
  final double amount;
  final String paymentStatus;
  final String deliveryStatus;
  final DateTime createdAt;

  Transaction({
    required this.id,
    required this.annonce,
    required this.buyer,
    required this.seller,
    required this.amount,
    required this.paymentStatus,
    required this.deliveryStatus,
    required this.createdAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
