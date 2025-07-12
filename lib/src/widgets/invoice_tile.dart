
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../config/constants.dart';
import 'package:intl/intl.dart';

class InvoiceTile extends StatelessWidget {
  final Transaction transaction;
  final VoidCallback onViewPdf;

  const InvoiceTile({
    Key? key,
    required this.transaction,
    required this.onViewPdf,
  }) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final date = DateFormat.yMMMd().format(transaction.createdAt);
    return ListTile(
      leading: const Icon(Icons.picture_as_pdf, color: AppColors.primary),
      title: Text('Facture #${transaction.id}'),
      subtitle: Text('$date • ${transaction.amount.toStringAsFixed(2)} DH'),
      trailing: IconButton(
        icon: const Icon(Icons.open_in_new),
        onPressed: onViewPdf,
      ),
    );
  }
}
