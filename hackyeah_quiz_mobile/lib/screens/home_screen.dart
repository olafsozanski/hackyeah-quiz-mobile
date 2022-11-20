import 'package:flutter/material.dart';
import 'package:hackyeah_quiz_mobile/screens/question_template.dart';
import 'package:hackyeah_quiz_mobile/theme/theme.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/screens/home_screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final _focusNodes = List.generate(6, (index) => FocusNode());
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
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Row(
                children: List.generate(
              6,
              (index) => Expanded(
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: TextField(
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      if (value.length == 1 && index != 5) {
                        _focusNodes[index + 1].requestFocus();
                      } else if (index == 5) {
                        _focusNodes[5].unfocus();
                      }
                    },
                  ),
                ),
              ),
            )),
          ),
          SizedBox(
            height: 70,
            width: 200,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QuestionTemplate()));
                },
                child: const Text('Dołącz')),
          )
        ],
      ),
    );
  }
}
