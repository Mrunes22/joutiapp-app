
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../services/payment_service.dart';

class CheckoutScreen extends StatelessWidget {
  static const routeName = '/checkout';

  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tx = ModalRoute.of(context)!.settings.arguments as Transaction;
    return Scaffold(
      appBar: AppBar(title: const Text('Paiement')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Montant à payer: ${tx.amount} DH'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO: Stripe natif
              },
              child: const Text('Payer avec Stripe'),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: PaymentService().cmiCheckout(
                'https://ton-backend/joutiapp/cmi/checkout/${tx.id}',
                    (success) {
                  if (success) {
                    Navigator.popUntil(context, ModalRoute.withName('/cart'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
