import '../config/constants.dart';
import 'api_client.dart';
import '../models/review.dart';

class ReviewService {
  final _dio = ApiClient.instance;

  /// Crée une review sur une transaction
  Future<Review> createReview({
    required String transactionId,
    required int note,
    required String comment,
  }) async {
    final resp = await _dio.post(ApiConstants.reviews, data: {
      'transaction': '/api/transactions/$transactionId',
      'note': note,
      'comment': comment,
    });
    return Review.fromJson(resp.data);
  }

  /// Récupère les reviews d’un utilisateur ou transaction
  Future<List<Review>> fetchReviews({String? reviewedId}) async {
    final params = reviewedId != null ? {'reviewed': reviewedId} : null;
    final resp = await _dio.get(ApiConstants.reviews, queryParameters: params);
    return (resp.data['hydra:member'] as List)
        .map((j) => Review.fromJson(j))
        .toList();
  }
}
