import 'package:flutter/material.dart';
import 'package:quiz_app/Constants/constants.dart';

class QuestionWidget extends StatelessWidget {
  QuestionWidget(
      {Key? key,
      required this.actionIndex,
      required this.question,
      required this.totalQuestions})
      : super(key: key);

  final String question;

  final int actionIndex;

  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('Question ${actionIndex+1}/$totalQuestions: $question',style: TextStyle(color: neutral,fontSize: 24),) ,
    );
  }
}
