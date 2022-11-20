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
            appBarTheme: AppBarTheme(
                elevation: 0,
                titleTextStyle: AppTheme.typography.headline6
                    ?.copyWith(fontSize: 20, color: Colors.white)),
            textTheme: AppTheme.typography,
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(borderRadius: BorderRadius.zero),
              fillColor: Colors.white,
            ),
            outlinedButtonTheme: const OutlinedButtonThemeData(
                style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              )),
            )),
            elevatedButtonTheme: const ElevatedButtonThemeData(
                style: ButtonStyle(
              elevation: MaterialStatePropertyAll(0),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              )),
            ))),
        home: const HomeScreen());
  }
}
