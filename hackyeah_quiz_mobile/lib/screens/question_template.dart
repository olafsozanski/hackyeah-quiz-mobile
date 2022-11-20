import 'package:flutter/material.dart';
import 'package:hackyeah_quiz_mobile/screens/result_screen.dart';
import 'package:hackyeah_quiz_mobile/theme/theme.dart';

class QuestionTemplate extends StatefulWidget {
  static const routeName = "/screens/question_template";

  const QuestionTemplate({Key? key}) : super(key: key);

  @override
  State<QuestionTemplate> createState() => _QuestionTemplate();
}

class _QuestionTemplate extends State<QuestionTemplate> {
  var counter = 1;
  var max = 10;

  void incrementCounter() {
    if (counter >= max) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ResultScreen()));
    } else {
      setState(() {
        counter++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Pytanie nr $counter'),
        ),
        body: Container(
          margin: AppTheme.spacing.screenPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Center(
                child: Text(
                  "Treść pytania",
                  style: AppTheme.typography.headline2,
                ),
              )),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: incrementCounter,
                      child: Container(
                          padding: AppTheme.spacing.screenPadding,
                          margin: AppTheme.spacing.screenPadding,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffd2d6dc))),
                          child: Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "A: Treść odpowiedzi",
                                style: AppTheme.typography.bodyText1,
                              ),
                            ),
                          )),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: incrementCounter,
                      child: Container(
                          padding: AppTheme.spacing.screenPadding,
                          margin: AppTheme.spacing.screenPadding,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffd2d6dc))),
                          child: Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "B: Treść odpowiedzi",
                                style: AppTheme.typography.bodyText1,
                              ),
                            ),
                          )),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: incrementCounter,
                      child: Container(
                          padding: AppTheme.spacing.screenPadding,
                          margin: AppTheme.spacing.screenPadding,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffd2d6dc))),
                          child: Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "C: Treść odpowiedzi",
                                style: AppTheme.typography.bodyText1,
                              ),
                            ),
                          )),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: incrementCounter,
                      child: Container(
                          padding: AppTheme.spacing.screenPadding,
                          margin: AppTheme.spacing.screenPadding,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffd2d6dc))),
                          child: Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "D: Treść odpowiedzi",
                                style: AppTheme.typography.bodyText1,
                              ),
                            ),
                          )),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
