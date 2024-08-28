import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:laza/Contactus.dart';
import 'package:laza/aboutus.dart';
import 'package:laza/authgate.dart';
import 'package:laza/cart_screen.dart';
import 'package:laza/dashboard.dart';
import 'package:laza/firebase_options.dart';
import 'package:laza/home_screen.dart';
import 'package:laza/my_cards_screen.dart';
import 'package:laza/splash_screen.dart';
import 'package:laza/theme.dart';
import 'package:laza/wishlist_screen.dart';
import 'package:laza/Cart.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure bindings are initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            title: 'Laza',
            debugShowCheckedModeBanner: false,
            themeMode: themeNotifier.themeMode,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            home: AuthGate(),
            routes: {
              '/authgate': (context) => const AuthGate(),
              '/dashboard': (context) => const Dashboard(),
              '/contactus': (context) => Contactus(),
              '/home': (context) => const HomeScreen(),
              '/wishlist': (context) => const WishlistScreen(),
              '/cart': (context) => const CartScreen(),
              '/my_cards': (context) => const MyCardsScreen(),
              '/aboutus': (context) => aboutus(),
            },
          );
        },
      ),
    );
  }
}
