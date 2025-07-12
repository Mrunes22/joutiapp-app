
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/transaction.dart';

class InvoiceViewerScreen extends StatelessWidget {
  static const routeName = '/invoice_viewer';
  const InvoiceViewerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final tx = ModalRoute.of(c)!.settings.arguments as Transaction;
    final url = 'http://127.0.0.1:8000/api/transactions/${tx.id}/invoice.pdf';
    return Scaffold(
      appBar: AppBar(title: Text('Facture #${tx.id}')),
      body: WebView(initialUrl: url, javascriptMode: JavascriptMode.unrestricted),
    );
  }
}
