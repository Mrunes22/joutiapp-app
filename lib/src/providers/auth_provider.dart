import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_service.dart';

/// État d’authentification
class AuthState {
  final bool isLoading;
  final bool isAuthenticated;
  final String? token;
  final String? error;

  AuthState({
    this.isLoading = false,
    this.isAuthenticated = false,
    this.token,
    this.error,
  });

  AuthState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    String? token,
    String? error,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      token: token ?? this.token,
      error: error,
    );
  }
}

/// Le StateNotifier qui gère l’authentification
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _service;

  AuthNotifier(this._service) : super(AuthState());

  /// Appelé au lancement pour vérifier un token existant
  Future<void> init() async {
    state = state.copyWith(isLoading: true);
    final stored = await _service.getToken();
    if (stored != null) {
      state = state.copyWith(
        isLoading: false,
        isAuthenticated: true,
        token: stored,
      );
    } else {
      state = state.copyWith(isLoading: false);
    }
  }

  /// Se logger avec email / password
  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final token = await _service.login(email, password);
      await _service.saveToken(token);
      state = state.copyWith(
        isLoading: false,
        isAuthenticated: true,
        token: token,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Logout
  Future<void> logout() async {
    await _service.clearToken();
    state = AuthState();
  }
}

/// Provider global de l’AuthNotifier
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final service = AuthService();
  final notifier = AuthNotifier(service);
  // On peut initialiser ici :
  notifier.init();
  return notifier;
});

/// Provider pratique pour savoir si l’utilisateur est authentifié
final authenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authProvider).isAuthenticated;
});
