import 'package:arabic_quiz_app/core/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('اختبار'),
        backgroundColor: Colors.grey,
      ),
      body: const AppBody(),
    );
  }
}

class AppBody extends StatefulWidget {
  const AppBody({super.key});

  @override
  State<AppBody> createState() => AppBodyState();
}

class AppBodyState extends State<AppBody> {
  AppConstants appConstants = AppConstants();

  int currentQuestion = 0;
  Widget correctAnswer = const Padding(
      padding: EdgeInsets.all(3),
      child: Icon(Icons.thumb_up, color: Colors.green, size: 20));
  Widget incorrectAnswer = const Padding(
      padding: EdgeInsets.all(3),
      child: Icon(Icons.thumb_down, color: Colors.red, size: 20));

  List<Widget> answerResult = [];

  bool stop = false;
  int rightAnswers = 0;

  void checkAnswer(bool answer) {
    bool isCorrect = answer == appConstants.questionAnswer();
    if (!stop) {
      isCorrect
          ? {answerResult.add(correctAnswer), rightAnswers++}
          : answerResult.add(incorrectAnswer);
      setState(() {});
      if (appConstants.isFinished) {
        stop = true;
        Alert(
          context: context,
          type: rightAnswers >= (answerResult.length / 2)
              ? AlertType.success
              : AlertType.error,
          title: "انتهاء الاختبار",
          desc:
              "لقد أجبت على ${rightAnswers} سؤال من ${answerResult.length} سؤال",
          buttons: [
            DialogButton(
              onPressed: () {
                Navigator.pop(context);
                answerResult.clear();
                rightAnswers = 0;
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              width: 120,
              child: const Text(
                "ابدأ من جديد",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 30,
            width: double.infinity - 20,
            alignment: Alignment.centerLeft,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: answerResult.length,
              itemBuilder: (context, index) {
                return answerResult[index];
              },
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Image.asset(appConstants.questionImage()),
                const SizedBox(height: 20),
                Text(
                  appConstants.questionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                ),
                onPressed: () {
                  checkAnswer(true);
                },
                child: const Text(
                  'صح',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                ),
                onPressed: () {
                  checkAnswer(false);
                },
                child: const Text(
                  'خطأ',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
