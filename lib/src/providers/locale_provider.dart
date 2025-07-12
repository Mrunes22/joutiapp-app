import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Clé pour stocker la locale en local
const _localeKey = 'app_locale';

/// Notifier pour la locale de l’application
class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(_initialLocale);

  /// Calcule la locale initiale : préférences ou système
  static Locale get _initialLocale {
    // On pourrait lire SharedPreferences ici si on était sync,
    // mais on initialise avec la locale système par défaut :
    final system = window.locale;
    if (['fr', 'ar', 'en'].contains(system.languageCode)) {
      return Locale(system.languageCode);
    }
    return const Locale('fr');
  }

  /// Change la locale et la persiste
  Future<void> setLocale(Locale locale) async {
    state = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
  }

  /// Charge la locale depuis SharedPreferences
  Future<void> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_localeKey);
    if (code != null && ['fr', 'ar', 'en'].contains(code)) {
      state = Locale(code);
    }
  }
}

/// Provider global pour la locale
final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  final notifier = LocaleNotifier();
  // Charge la locale sauvegardée si elle existe
  notifier.loadLocale();
  return notifier;
});
