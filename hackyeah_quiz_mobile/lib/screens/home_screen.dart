import 'package:flutter/material.dart';
import 'package:hackyeah_quiz_mobile/screens/question_template.dart';
import 'package:hackyeah_quiz_mobile/theme/theme.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/screens/home_screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Quizy'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              'Wprowadź kod',
              style: AppTheme.typography.headline1,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: AppTheme.spacing.screenPadding,
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: AppTheme.spacing.screenPadding,
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: AppTheme.spacing.screenPadding,
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: AppTheme.spacing.screenPadding,
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: AppTheme.spacing.screenPadding,
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: AppTheme.spacing.screenPadding,
                  child: const TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuestionTemplate()));
              },
              child: const Text('Dołącz'))
        ],
      ),
    );
  }
}
