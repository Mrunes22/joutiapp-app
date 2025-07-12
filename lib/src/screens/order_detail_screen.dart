
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class OrderDetailScreen extends StatelessWidget {
  static const routeName = '/order_detail';
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final t = ModalRoute.of(c)!.settings.arguments as Transaction;
    return Scaffold(
      appBar: AppBar(title: Text('Commande #${t.id}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Annonce: ${t.annonce.split("/").last}'),
          Text('Montant: ${t.amount} DH'),
          Text('Paiement: ${t.paymentStatus}'),
          Text('Livraison: ${t.deliveryStatus}'),
          Text('Date: ${t.createdAt.toLocal()}'),
        ]),
      ),
    );
  }
}
