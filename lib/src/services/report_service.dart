import '../config/constants.dart';
import 'api_client.dart';
import '../models/report.dart';

class ReportService {
  final _dio = ApiClient.instance;

  /// Signale un utilisateur ou une annonce
  Future<Report> createReport({
    required String type,           // 'user' ou 'annonce'
    required String reporterId,     // ici on passe l’ID
    String? targetUserId,
    String? targetAnnonceId,
    required String reason,
  }) async {
    final data = {
      'type': type,
      'reason': reason,
      'reportedBy': '/api/users/$reporterId',
    };
    if (targetUserId != null) {
      data['targetUser'] = '/api/users/$targetUserId';
    }
    if (targetAnnonceId != null) {
      data['targetAnnonce'] = '/api/annonces/$targetAnnonceId';
    }

    final resp = await _dio.post(ApiConstants.reports, data: data);
    return Report.fromJson(resp.data);
  }

  /// Récupère la liste des signalements (admin)
  Future<List<Report>> fetchReports({bool onlyUnseen = false}) async {
    final params = onlyUnseen ? {'seen': false} : null;
    final resp = await _dio.get(ApiConstants.reports, queryParameters: params);
    return (resp.data['hydra:member'] as List)
        .map((j) => Report.fromJson(j))
        .toList();
  }

  /// Marque un signalement comme traité
  Future<void> markSeen(String reportId) async {
    await _dio.patch('${ApiConstants.reports}/$reportId', data: {'seen': true});
  }
}
