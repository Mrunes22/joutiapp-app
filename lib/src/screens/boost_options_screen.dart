
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/annonce_service.dart';

class BoostOptionsScreen extends ConsumerWidget {
  static const routeName = '/boost_options';
  const BoostOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c, WidgetRef ref) {
    final annonceId = ModalRoute.of(c)!.settings.arguments as String;
    final options = [
      _Option('24h', 10),
      _Option('48h', 18),
      _Option('72h', 25),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Booster l’annonce')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: options.map((o) {
          return Card(
            child: ListTile(
              title: Text('${o.days} heures'),
              subtitle: Text('${o.price} DH'),
              trailing: ElevatedButton(
                onPressed: () async {
                  await AnnonceService().boostAnnonce(annonceId);
                  ScaffoldMessenger.of(c).showSnackBar(const SnackBar(content: Text('Annonce boostée !')));
                  Navigator.pop(c);
                },
                child: const Text('Choisir'),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _Option {
  final int days, price;
  _Option(this.days, this.price);
}
