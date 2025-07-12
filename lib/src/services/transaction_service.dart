import '../config/constants.dart';
import 'api_client.dart';
import '../models/transaction.dart';

class TransactionService {
  final _dio = ApiClient.instance;

  /// Crée une transaction (escrow)
  Future<Transaction> createTransaction({
    required String annonceId,
    required double amount,
  }) async {
    final resp = await _dio.post(ApiConstants.transactions, data: {
      'annonce': '/api/annonces/$annonceId',
      'amount': amount,
    });
    return Transaction.fromJson(resp.data);
  }

  /// Récupère les transactions de l’utilisateur
  Future<List<Transaction>> fetchTransactions() async {
    final resp = await _dio.get(ApiConstants.transactions);
    return (resp.data['hydra:member'] as List)
        .map((j) => Transaction.fromJson(j))
        .toList();
  }

  /// Met à jour le statut de paiement/livraison
  Future<void> updateStatus(
      String transactionId, {
        String? paymentStatus,
        String? deliveryStatus,
      }) async {
    final data = <String, dynamic>{};
    if (paymentStatus != null) data['paymentStatus'] = paymentStatus;
    if (deliveryStatus != null) data['deliveryStatus'] = deliveryStatus;
    await _dio.patch('${ApiConstants.transactions}/$transactionId', data: data);
  }
}
