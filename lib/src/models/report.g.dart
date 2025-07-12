// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      id: json['id'] as String,
      type: json['type'] as String,
      reason: json['reason'] as String,
      reportedBy: json['reportedBy'] as String,
      targetUser: json['targetUser'] as String?,
      targetAnnonce: json['targetAnnonce'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'reason': instance.reason,
      'reportedBy': instance.reportedBy,
      'targetUser': instance.targetUser,
      'targetAnnonce': instance.targetAnnonce,
      'createdAt': instance.createdAt.toIso8601String(),
    };
