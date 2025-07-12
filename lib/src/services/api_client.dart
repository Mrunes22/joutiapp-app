import 'package:dio/dio.dart';
import '../config/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiClient {
  static final _storage = const FlutterSecureStorage();
  static final Dio instance = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: AppDurations.httpTimeout),
      receiveTimeout: const Duration(seconds: AppDurations.httpTimeout),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  )..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Injecte le token JWT si présent
        final token = await _storage.read(key: 'jwt_token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioError e, handler) {
        // Gestion globale des erreurs HTTP
        // e.g. rediriger sur login si 401
        if (e.response?.statusCode == 401) {
          // TODO: notifier logout
        }
        return handler.next(e);
      },
    ),
  );
}
