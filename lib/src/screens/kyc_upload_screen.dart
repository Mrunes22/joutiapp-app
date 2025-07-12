
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/profile_provider.dart';

class KycUploadScreen extends ConsumerStatefulWidget {
  static const routeName = '/kyc_upload';
  const KycUploadScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<KycUploadScreen> createState() => _KycUploadScreenState();
}

class _KycUploadScreenState extends ConsumerState<KycUploadScreen> {
  File? _idFile;
  bool _loading = false;

  Future<void> _pick() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img != null) setState(() => _idFile = File(img.path));
  }

  Future<void> _submit() async {
    if (_idFile == null) return;
    setState(() => _loading = true);
    await ref.read(profileProvider.notifier).uploadKyc(_idFile!);
    setState(() => _loading = false);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(title: const Text('Vérification d’identité')),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        _idFile != null
            ? Image.file(_idFile!, height: 200)
            : Container(height: 200, color: Colors.grey[200], child: const Icon(Icons.insert_drive_file, size: 80)),
        TextButton.icon(
          icon: const Icon(Icons.upload_file),
          label: const Text('Téléverser pièce d’identité'),
          onPressed: _pick,
        ),
        const SizedBox(height: 24),
        _loading
            ? const CircularProgressIndicator()
            : ElevatedButton(onPressed: _submit, child: const Text('Envoyer')),
      ]),
    ),
  );
}
