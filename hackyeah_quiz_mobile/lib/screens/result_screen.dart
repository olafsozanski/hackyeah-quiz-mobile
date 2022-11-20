import 'package:flutter/material.dart';
import 'package:hackyeah_quiz_mobile/screens/home_screen.dart';
import 'package:hackyeah_quiz_mobile/theme/theme.dart';

class ResultScreen extends StatelessWidget {
  static const routeName = "/screens/result_screen";

  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Wynik końcowy'),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Twój wynik:",
                  style: AppTheme.typography.headline2,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "liczba dobrych odpowiedzi/ilość pytań",
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
                child: InkWell(
                  onTap: () {
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
      ),
    );
  }
}
