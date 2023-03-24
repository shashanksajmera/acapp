import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/chat.dart';
import 'screens/home.dart';
import 'screens/loadingscreen.dart';
import 'screens/messages.dart';
import 'screens/score.dart';
import 'screens/worksheets.dart';


Future<void> main() async {
  runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/loading': (context) => const LoadingScreen(),
        '/home': (context) => const Home(),
        '/worksheets': (context) => const Worksheets(),
        '/scores': (context) => const Scores(),
        '/chat': (context) => const Chat(),
        '/messages': (context) => const Messages(),
      },
      theme: ThemeData(
          colorScheme: const ColorScheme(

            brightness: Brightness.dark,
            primary: Color(0xFFA4C9FF),
            onPrimary: Color(0xFF00315D),
            secondary: Color(0xFFFFB960),
            onSecondary: Color(0xFF472A00),
            error: Colors.red,
            onError: Colors.white,
            background: Color(0xFF00315D),
            onBackground: Colors.white,
            surface: Color(0xFF00315D),
            onSurface: Colors.white,

          ),
          scaffoldBackgroundColor: const Color(0xFF00315D),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF00315D),
            foregroundColor: Colors.white,
          ),
          cardColor: const Color(0xFF00315D),
          // primaryColor: const Color(0xFFA4C9FF),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                // textStyle: Theme.of(context).textTheme.titleMedium,
                // textStyle: TextStyle(color: Colors.black),
                minimumSize: Size.zero,
                foregroundColor: Color(0xFF472A00),
                backgroundColor: const Color(0xFFFFB960),
              )
          ),
      )
  ));
}

