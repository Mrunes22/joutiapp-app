// lib/src/screens/annonce_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/annonce.dart';
import '../services/annonce_service.dart';

class AnnonceDetailScreen extends ConsumerWidget {
  static const routeName = '/annonce_detail';

  const AnnonceDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final annonce = ModalRoute.of(context)!.settings.arguments as Annonce;

    return Scaffold(
      appBar: AppBar(title: Text(annonce.titre)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (annonce.imageName != null)
              Image.network('${ApiConstants.baseUrl}/images/annonces/${annonce.imageName}'),
            const SizedBox(height: 12),
            Text(annonce.titre, style: Theme.of(context).textTheme.headline6),
            Text('${annonce.prix} DH', style: const TextStyle(fontSize: 20)),
            const Divider(height: 24),
            Text('Description', style: Theme.of(context).textTheme.subtitle1),
            Text(annonce.description),
            const SizedBox(height: 12),
            Text('Brand: ${annonce.brand}'),
            Text('Size: ${annonce.size}'),
            Text('État: ${annonce.etat}'),
            Text('Couleur: ${annonce.color}'),
            Text('Matière: ${annonce.material}'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO: ouverture chat / négociation
              },
              child: const Text('Contacter le vendeur'),
            ),
          ],
        ),
      ),
    );
  }
}
