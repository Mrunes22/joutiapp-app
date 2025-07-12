
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/transaction.dart';
import '../services/transaction_service.dart';
import 'checkout_screen.dart';

class CartScreen extends ConsumerWidget {
  static const routeName = '/cart';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final txs = ref.watch(_transactionsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Mes Achats')),
      body: txs.when(
        data: (list) => ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, i) {
            final t = list[i];
            return ListTile(
              title: Text('Annonce ${t.annonce.split("/").last}'),
              subtitle: Text('Statut: ${t.paymentStatus}'),
              trailing: t.paymentStatus != 'paid'
                  ? TextButton(
                child: const Text('Payer'),
                onPressed: () => Navigator.pushNamed(
                  context,
                  CheckoutScreen.routeName,
                  arguments: t,
                ),
              )
                  : const Icon(Icons.check, color: Colors.green),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Erreur: $e')),
      ),
    );
  }
}

final _transactionsProvider = FutureProvider<List<Transaction>>((_) {
  return TransactionService().fetchTransactions();
});
