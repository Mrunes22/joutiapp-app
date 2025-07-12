
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auth_service.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  static const routeName = '/register';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _confirm = TextEditingController();
  bool _loading = false;
  String? _error;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_pass.text != _confirm.text) {
      setState(() => _error = 'Les mots de passe ne correspondent pas');
      return;
    }
    setState(() { _loading = true; _error = null; });
    try {
      // POST /api/users
      await AuthService().register(_email.text, _pass.text);
      Navigator.pop(context);
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(title: const Text('Inscription')),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
            controller: _email,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (v) => v!.contains('@') ? null : 'Email invalide',
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _pass,
            decoration: const InputDecoration(labelText: 'Mot de passe'),
            obscureText: true,
            validator: (v) => v!.length >= 6 ? null : 'Min. 6 caractères',
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _confirm,
            decoration: const InputDecoration(labelText: 'Confirmez le mot de passe'),
            obscureText: true,
            validator: (v) => v!.isNotEmpty ? null : 'Champ requis',
          ),
          const SizedBox(height: 24),
          if (_loading) const CircularProgressIndicator(),
          if (!_loading) ElevatedButton(onPressed: _submit, child: const Text('S’inscrire')),
          if (_error != null) Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(_error!, style: const TextStyle(color: Colors.red)),
          ),
        ]),
      ),
    ),
  );
}
