import 'package:costdeko/management/store.dart';
import 'package:costdeko/pages/fragments/homeFragment.dart';
import 'package:costdeko/pages/fragments/sellFragment.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(VxState(
    store: AppStore(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cost Deko',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        textTheme: GoogleFonts.notoSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: FloatingNavBar(
        resizeToAvoidBottomInset: false,
        color: Vx.black,
        selectedIconColor: Colors.white,
        unselectedIconColor: Colors.white.withOpacity(0.6),
        items: [
          FloatingNavBarItem(
              iconData: Icons.home_outlined,
              page: const HomeFragment(),
              title: 'Buy'),
          FloatingNavBarItem(
              iconData: Icons.local_hospital_outlined,
              page: SellFragment(),
              title: 'Sell'),
          FloatingNavBarItem(
              iconData: Icons.account_circle,
              page: HomeFragment(),
              title: 'Account'),
        ],
        horizontalPadding: 40.0,
        hapticFeedback: true,
        showTitle: true,
      ),
    );
  }
}
