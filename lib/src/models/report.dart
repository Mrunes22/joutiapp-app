
import 'package:json_annotation/json_annotation.dart';

part 'report.g.dart';

@JsonSerializable()
class Report {
  final String id;
  final String type;
  final String reason;
  final String reportedBy;
  final String? targetUser;
  final String? targetAnnonce;
  final DateTime createdAt;

  Report({
    required this.id,
    required this.type,
    required this.reason,
    required this.reportedBy,
    this.targetUser,
    this.targetAnnonce,
    required this.createdAt,
  });

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
  Map<String, dynamic> toJson() => _$ReportToJson(this);
}
