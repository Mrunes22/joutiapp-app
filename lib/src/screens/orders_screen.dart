
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/transaction_service.dart';
import '../models/transaction.dart';
import 'order_detail_screen.dart';

class OrdersScreen extends ConsumerWidget {
  static const routeName = '/orders';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c, WidgetRef ref) {
    final txs = ref.watch(_allTransactionsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Mes Commandes')),
      body: txs.when(
        data: (list) => ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, i) {
            final t = list[i];
            return ListTile(
              title: Text('Commande #${t.id}'),
              subtitle: Text('Statut: ${t.deliveryStatus}'),
              onTap: () => Navigator.pushNamed(
                c, OrderDetailScreen.routeName,
                arguments: t,
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur: $e')),
      ),
    );
  }
}

final _allTransactionsProvider = FutureProvider<List<Transaction>>((_) {
  return TransactionService().fetchTransactions();
});
