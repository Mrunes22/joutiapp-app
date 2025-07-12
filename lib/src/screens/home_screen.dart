
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/annonce_service.dart';
import '../models/annonce.dart';
import 'annonce_detail_screen.dart';

class HomeScreen extends ConsumerWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final annoncesAsync = ref.watch(_annoncesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Annonces')),
      body: annoncesAsync.when(
        data: (list) => ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, i) {
            final a = list[i];
            return ListTile(
              leading: a.imageName != null
                  ? Image.network('${ApiConstants.baseUrl}/images/annonces/${a.imageName}')
                  : const Icon(Icons.image_outlined),
              title: Text(a.titre),
              subtitle: Text('${a.prix} DH'),
              onTap: () => Navigator.pushNamed(
                context,
                AnnonceDetailScreen.routeName,
                arguments: a,
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // TODO: naviguer vers création d’annonce
        },
      ),
    );
  }
}

final _annoncesProvider = FutureProvider<List<Annonce>>((_) {
  return AnnonceService().fetchAnnonces();
});
