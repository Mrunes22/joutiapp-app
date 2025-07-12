
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/transaction_service.dart';
import '../models/transaction.dart';
import 'invoice_viewer_screen.dart';

class InvoicesScreen extends ConsumerWidget {
  static const routeName = '/invoices';
  const InvoicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c, WidgetRef ref) {
    final txs = ref.watch(_paidTransactionsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Factures')),
      body: txs.when(
        data: (list) => ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, i) {
            final t = list[i];
            return ListTile(
              title: Text('Facture #${t.id}'),
              subtitle: Text('${t.amount} DH - ${t.createdAt.toLocal().toShortDateString()}'),
              trailing: IconButton(
                icon: const Icon(Icons.picture_as_pdf),
                onPressed: () => Navigator.pushNamed(
                  c, InvoiceViewerScreen.routeName,
                  arguments: t,
                ),
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

final _paidTransactionsProvider = FutureProvider<List<Transaction>>((_) async {
  final all = await TransactionService().fetchTransactions();
  return all.where((t) => t.paymentStatus == 'paid').toList();
});
