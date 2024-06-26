import 'package:flutter/material.dart';

import 'pages/challenge.dart';
import 'pages/login.dart';
import 'pages/register.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'login': (context) => const Login(),
        'register': (context) => const Register(),
        'challenge': (context) => const Challenge(),
      },
      initialRoute: 'login',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.blue, foregroundColor: Colors.white),
          filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(backgroundColor: Colors.blue))),
    );
  }
}
