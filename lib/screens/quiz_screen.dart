import 'package:flutter/material.dart';
import 'package:quiz_app/Widgets/next_button.dart';
import 'package:quiz_app/Widgets/option_card.dart';
import 'package:quiz_app/Widgets/question_widgets.dart';
import 'package:quiz_app/Widgets/result_box.dart';
import 'package:quiz_app/Constants/constants.dart';
import 'package:quiz_app/model/db_connection.dart';
import 'package:quiz_app/model/question_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var db = DbConnect();
  late Future _questions;
  // List<Questions> _questions = [
  //   Questions(
  //       id: '10',
  //       title: 'What is the Sum of 2+2',
  //       options: {'5': false, '4': true, '6': false, '7': false}),
  //   Questions(
  //       id: '11',
  //       title: 'What is the Sum of 12+20',
  //       options: {'25': false, '32': true, '36': false, '47': false})
  // ];

  Future<List<Questions>> getData() async {
    return db.fetchQuestions();
  }

  @override
  void initState() {
    _questions = getData();
    // TODO: implement initState
    super.initState();
  }

  int index = 0;

  int Score = 0;

  bool isPressed = false;

  bool isAlreadySelected = false;

  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => ResultBox(
                Result: Score,
                questionLength: questionLength,
                onPressed: startOver,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false; // Reset the isPressed flag for the next question
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please Select one Option Carefully'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20),
        ));
      }
    }
  }

  void changeColor() {
    setState(() {
      isPressed = true;
    });
  }

  void checkAnswer(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
        if (value == true) {
          Score++;
        }
      });
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      isPressed = false;
      isAlreadySelected = false;
      Score = 0;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questions as Future<List<Questions>>,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data as List<Questions>;
            return Scaffold(
              backgroundColor: background,
              appBar: AppBar(
                title: const Text(
                  'Quiz App',
                  style: TextStyle(color: neutral),
                ),
                backgroundColor: background,
                actions: [
                  Text(
                    'Score: $Score',
                    style: TextStyle(fontSize: 18.0, color: neutral),
                  )
                ],
              ),
              body: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    QuestionWidget(
                      actionIndex: index,
                      question: extractedData[index].title,
                      totalQuestions: extractedData.length,
                    ),
                    Divider(
                      color: neutral,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    for (int i = 0;
                        i < extractedData[index].options.length;
                        i++)
                      GestureDetector(
                        onTap: () => checkAnswer(
                            extractedData[index].options.values.toList()[i]),
                        child: OptionCard(
                          option: extractedData[index]
                              .options
                              .entries
                              .toList()[i]
                              .key,
                          color: isPressed
                              ? extractedData[index]
                                          .options
                                          .values
                                          .toList()[i] ==
                                      true
                                  ? correct
                                  : inCorrect
                              : neutral,
                        ),
                      ),
                  ],
                ),
              ),
              floatingActionButton: GestureDetector(
                onTap: () => nextQuestion(extractedData.length),
                child: NextButton(),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          } else {
            return const Center(
              child: Column(
                children: [
                  CircularProgressIndicator(color: Colors.white,),
                  Text('plz Wait we are loading Questions for you')
                ],
              ),
            );
          }
        }
        return Text('no Data');
      },
    );
  }
}
