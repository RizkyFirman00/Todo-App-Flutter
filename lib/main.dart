import 'package:belajar_state_management/view/page_home.dart';
import 'package:belajar_state_management/view%20model/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ItemProvider()),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.jostTextTheme(),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
                  textStyle: const WidgetStatePropertyAll(
                      TextStyle(fontWeight: FontWeight.w600)),
                  foregroundColor: const WidgetStatePropertyAll(Colors.white),
                  backgroundColor:
                      const WidgetStatePropertyAll(Color(0xff9395D3))))),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
