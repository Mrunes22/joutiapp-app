import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialise Firebase pour Analytics & Crashlytics
  await Firebase.initializeApp();
  // Redirige toutes les erreurs Flutter vers Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(
    // Riverpod pour la gestion d'état globale
    const ProviderScope(
      child: JoutiApp(),
    ),
  );
}
