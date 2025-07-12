
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/annonce_service.dart';
import '../models/annonce.dart';
import 'add_listing_screen.dart';
import 'annonce_detail_screen.dart';

class MyListingsScreen extends ConsumerWidget {
  static const routeName = '/my_listings';
  const MyListingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c, WidgetRef ref) {
    final list = ref.watch(_myAnnoncesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Mes Annonces')),
      body: list.when(
        data: (items) => ListView.builder(
          itemCount: items.length,
          itemBuilder: (_, i) {
            final a = items[i];
            return ListTile(
              title: Text(a.titre),
              subtitle: Text('${a.prix} DH'),
              onTap: () => Navigator.pushNamed(
                c, AddListingScreen.routeName,
                arguments: a,
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur : $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(c, AddListingScreen.routeName),
        child: const Icon(Icons.add),
      ),
    );
  }
}

final _myAnnoncesProvider = FutureProvider<List<Annonce>>((_) {
  // TODO : filtrer par seller courant
  return AnnonceService().fetchAnnonces();
});
