import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int correctNum = 0;
  int wrongNum = 0;

  alert(String title, String desc) {
    return Alert(
      context: context,
      title: title,
      style: const AlertStyle(
          titleStyle: TextStyle(fontSize: 25), isOverlayTapDismiss: false),
      desc: desc,
      closeIcon: const Icon(Icons.close, color: Colors.red),
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "PLAY AGAIN",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    if (quizBrain.isFinished() == true) {
      if (correctNum > wrongNum) {
        alert('You win!', 'You got $correctNum questions right.');
      } else if (wrongNum > correctNum) {
        alert('You loose!', 'You just got $correctNum questions right.');
      } else {
        alert('Finished!', 'You didn\'t win but didn\'t loose!');
      }
      quizBrain.reset();
      scoreKeeper = [];
      correctNum = 0;
      wrongNum = 0;
    } else {
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
        correctNum++;
      } else {
        scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
        wrongNum++;
      }
    }
    setState(() {
      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              // color: Colors.red,
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
