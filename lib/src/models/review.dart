
import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  final String id;
  final int note;
  final String comment;
  final String reviewer;
  final String reviewed;
  final String transaction;

  Review({
    required this.id,
    required this.note,
    required this.comment,
    required this.reviewer,
    required this.reviewed,
    required this.transaction,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
