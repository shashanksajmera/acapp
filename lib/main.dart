// import 'package:ajmeraclassesapp/api/notificationsListener.dart';
import 'package:ajmeraclassesapp/model/user.dart';
import 'package:ajmeraclassesapp/screens/admin/addtestscores.dart';
import 'package:ajmeraclassesapp/screens/admin/manage.dart';
import 'package:ajmeraclassesapp/screens/admin/manageclass.dart';
import 'package:ajmeraclassesapp/screens/admin/register.dart';
import 'package:ajmeraclassesapp/screens/login.dart';
import 'package:ajmeraclassesapp/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'screens/chat.dart';
import 'screens/home.dart';
import 'screens/loadingscreen.dart';
import 'screens/messages.dart';
import 'screens/scores.dart';
import 'screens/worksheets.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => CurrentUserData(),
    child: MaterialApp(
        initialRoute: '/loading',
        routes: {
          '/login': (context) => const Login(),
          '/loading': (context) => const LoadingScreen(),
          '/': (context) => const Home(),
          '/home': (context) => const Home(),
          '/worksheets': (context) => const Worksheets(),
          '/scores': (context) => const Scores(),
          '/chat': (context) => const Chat(),
          '/messages': (context) => const Messages(),
          '/profile' : (context) => const Profile(),
          '/manage' : (context) => const ManageStudents(),
          '/manageClass' : (context) => const ManageClass(),
          '/register' : (context) => const RegisterStudent(),
          '/addtestscores' : (context) => const AddTestScores()
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
              primaryContainer: Color(0xFF004884),
              onPrimaryContainer: Colors.white

            ),
            scaffoldBackgroundColor: const Color(0xFF00315D),
            appBarTheme: const AppBarTheme(
              elevation: 0,
              scrolledUnderElevation: 2.0,
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
    ),
  ));
}

