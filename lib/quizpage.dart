import 'package:flutter/material.dart';
import 'package:quizzler/quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];
  // List<bool> answers = [false, true, true];

  QuizBrain quizBrain = QuizBrain();

  endOfQuestion() {
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.success,
          title: "QUIZZLER",
          desc: "You got score questions correctly",
          buttons: [
            DialogButton(
              child: Text(
                "RE-START",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  quizBrain.reset();
                  scoreKeeper.clear();
                  Navigator.pop(context);
                });
              },
              width: 120,
            )
          ],
        ).show();
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    quizBrain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25.0, color: Colors.white),
                  ),
                ),
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  bool correctAnswer = quizBrain.getCorrectAnswer();
                  setState(() {
                    if (correctAnswer == true) {
                      scoreKeeper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                    } else {
                      scoreKeeper.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    }
                    endOfQuestion();
                    quizBrain.nextQuestion();
                  });
                },
                child: Text(
                  'true',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  bool correctAnswer = quizBrain.getCorrectAnswer();
                  setState(() {
                    if (correctAnswer == false) {
                      scoreKeeper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                    } else {
                      scoreKeeper.add(Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    }
                    endOfQuestion();
                    quizBrain.nextQuestion();
                  });
                },
                child: Text(
                  'false',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          )
        ],
      ),
    );
  }
}
