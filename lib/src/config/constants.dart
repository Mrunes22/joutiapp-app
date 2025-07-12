// lib/src/config/constants.dart

import 'package:flutter/material.dart';

/// Palette de couleurs selon la charte graphique JoutiApp
class AppColors {
  AppColors._();

  /// Couleur principale (teal)
  static const Color primary = Color(0xFF009688);

  /// Couleur d’accent (light teal)
  static const Color accent = Color(0xFF4DB6AC);

  /// Texte principal
  static const Color textPrimary = Color(0xFF212121);

  /// Texte secondaire
  static const Color textSecondary = Color(0xFF757575);

  /// Fond de carte, champs de formulaire…
  static const Color background = Color(0xFFF5F5F5);

  /// Erreur / Alerte
  static const Color error = Color(0xFFD32F2F);
}

/// Endpoints et constantes liées à l’API
class ApiConstants {
  ApiConstants._();

  /// URL de base de votre API Symfony
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  /// Point d’entrée annonces
  static String get annonces => '$baseUrl/annonces';

  /// Authentification JWT
  static String get login => '$baseUrl/login';

  /// Mesures / Reviews
  static String get reviews => '$baseUrl/reviews';

  /// Messagerie
  static String get messages => '$baseUrl/messages';

  /// Transactions
  static String get transactions => '$baseUrl/transactions';

  /// Signalements
  static String get reports => '$baseUrl/reports';
}

/// Durées et timeouts généraux
class AppDurations {
  AppDurations._();

  /// Timeout HTTP (en secondes)
  static const int httpTimeout = 15;

  /// Durée de l’animation de transition
  static const Duration transition = Duration(milliseconds: 300);
}
