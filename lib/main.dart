import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = const [
      {
        "questionText": "What's is your name?",
        "answers": ["Arie", "Alex", "Asep"]
      },
      {
        "questionText": "Can I have your number?",
        "answers": ["Yes", "No", "I don't know"]
      },
      {
        "questionText": "Where do you live?",
        "answers": ["Tangerang", "Jakarta", "I don't know"]
      },
    ];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My First Flutter"),
          ),
          body: Column(
            children: [
              Question(questions[questionIndex]["questionText"]),
              // Answer(answerQuestion),
              // Answer(answerQuestion),
              // Answer(answerQuestion)
              ...(questions[questionIndex]["answers"] as List<String>)
                  .map((answer) {
                return Answer(answerQuestion, answer);
              }).toList()
            ],
          )),
    );
  }
}
