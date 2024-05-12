import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hb_flutter/screens/home_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: GoogleFonts.dmSans().fontFamily,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                ),
                backgroundColor: const MaterialStatePropertyAll(
                  Colors.orangeAccent,
                ),
                foregroundColor: const MaterialStatePropertyAll(
                  Colors.white,
                ),
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                ),
                textStyle: const MaterialStatePropertyAll(
                  TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
            useMaterial3: true,
          ),
          home: const HomeNav()
          // home: const ConenctZohoScreen(),
          ),
    );
  }
}
