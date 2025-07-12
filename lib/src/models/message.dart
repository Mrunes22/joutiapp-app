
import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  final String id;
  final String content;
  final String sender;
  final String receiver;
  final DateTime createdAt;
  final bool isRead;

  Message({
    required this.id,
    required this.content,
    required this.sender,
    required this.receiver,
    required this.createdAt,
    required this.isRead,
  });

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
