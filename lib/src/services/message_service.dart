import '../config/constants.dart';
import 'api_client.dart';
import '../models/message.dart';

class MessageService {
  final _dio = ApiClient.instance;

  /// Récupère tous les messages (ou ajoute un query pour conversation)
  Future<List<Message>> fetchMessages({String? annonceId}) async {
    final params = annonceId != null ? {'annonce': annonceId} : null;
    final resp = await _dio.get(ApiConstants.messages, queryParameters: params);
    return (resp.data['hydra:member'] as List)
        .map((j) => Message.fromJson(j))
        .toList();
  }

  /// Envoie un message
  Future<Message> sendMessage(String receiverId, String content) async {
    final resp = await _dio.post(ApiConstants.messages, data: {
      'receiver': '/api/users/$receiverId',
      'content': content,
    });
    return Message.fromJson(resp.data);
  }

  /// Marque un message comme lu (PATCH)
  Future<void> markRead(String messageId) async {
    await _dio.patch('${ApiConstants.messages}/$messageId', data: {'isRead': true});
  }
}
