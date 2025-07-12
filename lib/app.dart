import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'src/config/constants.dart';
import 'src/providers/auth_provider.dart';
import 'src/providers/locale_provider.dart';
import 'src/screens/splash_screen.dart';
import 'src/screens/onboarding_screen.dart';
import 'src/screens/register_screen.dart';
import 'src/screens/login_screen.dart';
import 'src/screens/home_screen.dart';
import 'src/screens/annonce_detail_screen.dart';
import 'src/screens/add_annonce_screen.dart';
import 'src/screens/search_screen.dart';
import 'src/screens/chat_list_screen.dart';
import 'src/screens/chat_screen.dart';
import 'src/screens/profile_screen.dart';
import 'src/screens/cart_screen.dart';
import 'src/screens/checkout_screen.dart';
import 'src/screens/bank_info_screen.dart';
import 'src/screens/kyc_upload_screen.dart';
import 'src/screens/invoices_screen.dart';
import 'src/screens/invoice_viewer_screen.dart';
import 'src/screens/orders_screen.dart';
import 'src/screens/order_detail_screen.dart';
import 'src/screens/order_confirmation_screen.dart';
import 'src/screens/my_listings_screen.dart';
import 'src/screens/boost_options_screen.dart';
import 'src/screens/messages_screen.dart';
import 'src/screens/conversation_screen.dart';
import 'src/screens/admin_dashboard_screen.dart';

class JoutiApp extends ConsumerWidget {
  const JoutiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Charge la locale et l'auth
    final locale = ref.watch(localeProvider);
    final isAuthenticated = ref.watch(authenticatedProvider);

    return MaterialApp(
      title: 'JoutiApp',
      debugShowCheckedModeBanner: false,
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        accentColor: AppColors.accent,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Lato',
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        OnboardingScreen.routeName: (_) => const OnboardingScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        RegisterScreen.routeName: (_) => const RegisterScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        AnnonceDetailScreen.routeName: (_) => const AnnonceDetailScreen(),
        AddAnnonceScreen.routeName: (_) => const AddAnnonceScreen(),
        SearchScreen.routeName: (_) => const SearchScreen(),
        ChatListScreen.routeName: (_) => const ChatListScreen(),
        ChatScreen.routeName: (_) => const ChatScreen(),
        ProfileScreen.routeName: (_) => const ProfileScreen(),
        CartScreen.routeName: (_) => const CartScreen(),
        CheckoutScreen.routeName: (_) => const CheckoutScreen(),
        BankInfoScreen.routeName: (_) => const BankInfoScreen(),
        KycUploadScreen.routeName: (_) => const KycUploadScreen(),
        InvoicesScreen.routeName: (_) => const InvoicesScreen(),
        InvoiceViewerScreen.routeName: (_) => const InvoiceViewerScreen(),
        OrdersScreen.routeName: (_) => const OrdersScreen(),
        OrderDetailScreen.routeName: (_) => const OrderDetailScreen(),
        OrderConfirmationScreen.routeName: (_) => const OrderConfirmationScreen(),
        MyListingsScreen.routeName: (_) => const MyListingsScreen(),
        BoostOptionsScreen.routeName: (_) => const BoostOptionsScreen(),
        MessagesScreen.routeName: (_) => const MessagesScreen(),
        ConversationScreen.routeName: (_) => const ConversationScreen(),
        AdminDashboardScreen.routeName: (_) => const AdminDashboardScreen(),
      },
    );
  }
}