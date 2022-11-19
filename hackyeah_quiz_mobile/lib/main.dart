import 'package:flutter/material.dart';
import 'package:hackyeah_quiz_mobile/screens/home_screen.dart';
import 'package:hackyeah_quiz_mobile/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quizy',
        theme: ThemeData(
          fontFamily: 'Inter',
          primarySwatch: AppTheme.colors.primary,
          scaffoldBackgroundColor: AppTheme.colors.appBackground,
        ),
        home: const HomeScreen());
  }
}
