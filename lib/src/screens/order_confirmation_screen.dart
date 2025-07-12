
import 'package:flutter/material.dart';

class OrderConfirmationScreen extends StatelessWidget {
  static const routeName = '/order_confirmation';
  const OrderConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(title: const Text('Confirmation')),
    body: Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Icon(Icons.check_circle, size: 80, color: Colors.green),
        const SizedBox(height: 16),
        const Text('Votre commande a été validée !', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              c, '/orders', (route) => false),
          child: const Text('Voir mes commandes'),
        ),
      ]),
    ),
  );
}
