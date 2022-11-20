import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hackyeah_quiz_mobile/dio.dart';
import 'package:hackyeah_quiz_mobile/screens/home_screen.dart';
import 'package:hackyeah_quiz_mobile/theme/theme.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = "/screens/result_screen";

  final String testId;
  final Map<String, dynamic> answers;
  Map<String, dynamic> result = {};

  ResultScreen({Key? key, required this.answers, required this.testId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Wynik końcowy'),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
        ),
        body: FutureBuilder(
          future: loadResult(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return buildLoading();
            }
            return buildContent(context);
          }),
        ));
  }

  Future<void> loadResult() async {
    final response = await dio.post('/tests/$testId/submit',
        data: jsonEncode(answers),
        options: Options(headers: {
          'Content-Type': 'application/json',
        }));
    result = response.data;
  }

  Widget buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget buildContent(BuildContext context) {
    print(answers);
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 48,
                color: AppTheme.colors.primary,
              ),
              SizedBox(height: 16),
              Text(
                "Twój wynik:",
                style: AppTheme.typography.headline2,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                result['correct'].toString() +
                    '/' +
                    result['available'].toString(),
                style: AppTheme.typography.bodyText1,
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                child: Text(
                  "Rozpocznij nowy quiz",
                  style: AppTheme.typography.bodyText1,
                ),
              ),
            )),
      ],
    );
  }
}
