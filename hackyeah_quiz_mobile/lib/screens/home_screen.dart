import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hackyeah_quiz_mobile/dio.dart';
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
  final _controllers = List.generate(6, (index) => TextEditingController());
  Future? _future = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Rozwiąż test'),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return buildLoading();
          }
          return buildHome();
        },
      ),
    );
  }

  Widget buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget buildHome() {
    return Container(
      padding: AppTheme.spacing.screenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Wprowadź kod',
            style: AppTheme.typography.headline1,
            textAlign: TextAlign.center,
          ),
          Text(
            'by dołączyć do testu',
            style: AppTheme.typography.bodyText1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Row(
                children: List.generate(
              6,
              (index) => Expanded(
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: TextField(
                    focusNode: _focusNodes[index],
                    controller: _controllers[index],
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      counterText: "",
                    ),
                    onChanged: (value) {
                      if (value.length == 1 && index != 5) {
                        _focusNodes[index + 1].requestFocus();
                      } else if (value.length != 1 && index > 0) {
                        _focusNodes[index - 1].requestFocus();
                      } else if (index == 5) {
                        _focusNodes[5].unfocus();
                      }
                    },
                  ),
                ),
              ),
            )),
          ),
          Container(
            height: 72,
            margin: AppTheme.spacing.screenPadding,
            child: ElevatedButton(
                onPressed: () => submitCode(), child: const Text('Dołącz')),
          )
        ],
      ),
    );
  }

  void submitCode() {
    final code =
        _controllers.map((controller) => controller.value.text).join('');

    _future = dio.get('tests/byJoinCode/$code');

    _future!.then((response) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => QuestionTemplate(
                    test: response.data,
                  )));
    });
  }
}
