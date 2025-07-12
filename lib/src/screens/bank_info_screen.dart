
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/profile_provider.dart';

class BankInfoScreen extends ConsumerWidget {
  static const routeName = '/bank_info';
  const BankInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final notifier = ref.read(profileProvider.notifier);
    final _ctrl = TextEditingController(text: profile.bankAccount);

    return Scaffold(
      appBar: AppBar(title: const Text('Coordonnées bancaires')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(
            controller: _ctrl,
            decoration: const InputDecoration(labelText: 'IBAN / RIB'),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => notifier.updateBankInfo(_ctrl.text),
            child: const Text('Enregistrer'),
          ),
        ]),
      ),
    );
  }
}
