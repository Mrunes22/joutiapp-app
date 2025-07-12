import 'package:dio/dio.dart';
import '../config/constants.dart';
import 'api_client.dart';
import '../models/annonce.dart';

class AnnonceService {
  final _dio = ApiClient.instance;

  /// Récupère la liste des annonces avec filtres optionnels
  Future<List<Annonce>> fetchAnnonces({
    String? category,
    double? minPrice,
    double? maxPrice,
  }) async {
    final query = <String, dynamic>{};
    if (category != null) query['category'] = category;
    if (minPrice != null) query['prix[gte]'] = minPrice;
    if (maxPrice != null) query['prix[lte]'] = maxPrice;

    final resp = await _dio.get(ApiConstants.annonces, queryParameters: query);
    return (resp.data['hydra:member'] as List)
        .map((json) => Annonce.fromJson(json))
        .toList();
  }

  /// Récupère le détail d’une annonce
  Future<Annonce> fetchAnnonce(String id) async {
    final resp = await _dio.get('${ApiConstants.annonces}/$id');
    return Annonce.fromJson(resp.data);
  }

  /// Crée une nouvelle annonce (multipart pour l’image)
  Future<Annonce> createAnnonce(Annonce a, MultipartFile? imageFile) async {
    final form = FormData.fromMap(a.toJson()..remove('id'));
    if (imageFile != null) form.files.add(MapEntry('imageFile', imageFile));
    final resp = await _dio.post(ApiConstants.annonces, data: form);
    return Annonce.fromJson(resp.data);
  }

  /// Met à jour une annonce existante
  Future<Annonce> updateAnnonce(Annonce a, {MultipartFile? imageFile}) async {
    final form = FormData.fromMap(a.toJson());
    if (imageFile != null) form.files.add(MapEntry('imageFile', imageFile));
    final resp = await _dio.put('${ApiConstants.annonces}/${a.id}', data: form);
    return Annonce.fromJson(resp.data);
  }

  /// Supprime une annonce
  Future<void> deleteAnnonce(String id) async {
    await _dio.delete('${ApiConstants.annonces}/$id');
  }

  /// Boost une annonce (endpoint custom)
  Future<void> boostAnnonce(String id) async {
    await _dio.post('${ApiConstants.annonces}/$id/boost');
  }
}
