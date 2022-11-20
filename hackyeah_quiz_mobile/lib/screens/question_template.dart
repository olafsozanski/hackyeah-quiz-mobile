import 'package:flutter/material.dart';
import 'package:hackyeah_quiz_mobile/dio.dart';
import 'package:hackyeah_quiz_mobile/screens/result_screen.dart';
import 'package:hackyeah_quiz_mobile/theme/theme.dart';

class QuestionTemplate extends StatefulWidget {
  static const routeName = "/screens/question_template";

  final Map<String, dynamic>
      test; // using maps is not a good idea, but we have 24 hours ;P

  const QuestionTemplate({Key? key, required this.test}) : super(key: key);

  @override
  State<QuestionTemplate> createState() => _QuestionTemplate();
}

class _QuestionTemplate extends State<QuestionTemplate> {
  var counter = 1;
  var questions = [];
  Map<String, dynamic> answers = {};

  void selectAnswer(index) {
    answers[questions[counter - 1]['_id']] = index;
    print(answers);
    if (counter >= questions.length) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResultScreen(
                    answers: answers,
                    testId: widget.test['_id'],
                  )));
    } else {
      setState(() {
        counter++;
      });
    }
  }

  Future<void> loadQuestions() async {
    final testId = widget.test['_id'];
    final response = await dio.get('tests/$testId/questions');
    questions = response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.test['title']),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: FutureBuilder(
          future: loadQuestions(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return buildLoading();
            }
            return buildContent();
          }),
        ));
  }

  Widget buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildContent() {
    final question = questions[counter - 1];
    return Container(
      margin: AppTheme.spacing.screenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 2,
              child: Center(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Pytanie nr $counter",
                    style: AppTheme.typography.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    questions[counter - 1]['content'],
                    style: AppTheme.typography.headline2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ))),
          for (final index
              in List.generate(question['answers'].length, (index) => index))
            Expanded(
                child: InkWell(
              onTap: () => selectAnswer(index),
              child: Container(
                  margin: AppTheme.spacing.screenPadding,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  decoration: BoxDecoration(
                      color: answers[question['_id']] == index
                          ? const Color(0xfffde8e8)
                          : null,
                      border: Border.all(
                          width: answers[question['_id']] == index ? 2 : 1,
                          color: answers[question['_id']] == index
                              ? AppTheme.colors.primary
                              : const Color(0xffd2d6dc))),
                  child: Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        question['answers'][index]['content'],
                        style: AppTheme.typography.bodyText1,
                      ),
                    ),
                  )),
            )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (counter != 1)
                  IconButton(
                      onPressed: (() {
                        setState(() {
                          counter--;
                        });
                      }),
                      icon: const Icon(Icons.arrow_back_ios)),
                const Expanded(
                  child: SizedBox(),
                ),
                if (counter != questions.length)
                  IconButton(
                      onPressed: (() {
                        setState(() {
                          counter++;
                        });
                      }),
                      icon: const Icon(Icons.arrow_forward_ios)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
