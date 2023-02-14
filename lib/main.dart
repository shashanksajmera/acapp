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
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: Colors.white
          ),
          headlineSmall: TextStyle(
            color: Colors.white
          ),
        ),
          scaffoldBackgroundColor: const Color(0xFF001B3F),
          appBarTheme: const AppBarTheme(
              backgroundColor:Color(0xFF001B3F),
              foregroundColor: Colors.white,
          ),
        // cardColor: const Color(0xFF002377),
        primaryColor: const Color(0xFFA4C9FF),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: Size.zero,
            foregroundColor: Colors.black,
            backgroundColor: const Color(0xFFFFB960),
          )
        )
      )
  ));
}

