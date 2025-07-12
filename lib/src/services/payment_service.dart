import 'dart:convert';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../config/constants.dart';

class PaymentService {
  PaymentService() {
    StripePayment.setOptions(
      StripeOptions(
        publishableKey: 'pk_test_YOUR_KEY',
        merchantId: 'joutiapp',
        androidPayMode: 'test',
      ),
    );
  }

  /// Paiement Stripe intégré natif
  Future<PaymentMethod> payWithStripe(double amount, String currency) async {
    final pm = await StripePayment.paymentRequestWithCardForm(
      CardFormPaymentRequest(),
    );
    // Appel backend pour créer PaymentIntent et confirmer ici
    return pm;
  }

  /// Paiement CMI via WebView
  Widget cmiCheckout(String url, void Function(bool success) onResult) {
    return WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
      navigationDelegate: (nav) {
        if (nav.url.contains('success')) {
          onResult(true);
          return NavigationDecision.prevent;
        } else if (nav.url.contains('cancel')) {
          onResult(false);
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    );
  }
}
