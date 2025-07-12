import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../config/constants.dart';
import 'api_client.dart';

class AuthService {
  final _storage = const FlutterSecureStorage();

  /// Appelle l’endpoint /login pour obtenir le JWT
  Future<String> login(String email, String password) async {
    final response = await ApiClient.instance.post(
      ApiConstants.login,
      data: {'email': email, 'password': password},
    );
    return response.data['token'] as String;
  }

  /// Sauvegarde le token en stockage sécurisé
  Future<void> saveToken(String token) async {
    await _storage.write(key: 'jwt_token', value: token);
  }

  /// Récupère le token stocké (ou null)
  Future<String?> getToken() => _storage.read(key: 'jwt_token');

  /// Supprime le token (logout)
  Future<void> clearToken() => _storage.delete(key: 'jwt_token');
}
