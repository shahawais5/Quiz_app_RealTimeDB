import 'package:flutter/material.dart';
import 'package:quiz_app/Constants/constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox(
      {Key? key, required this.questionLength, required this.Result,required this.onPressed})
      : super(key: key);

  final int Result;
  final int questionLength;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: EdgeInsets.all(70),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Result',
              style: TextStyle(fontSize: 22, color: neutral),
            ),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
                child: Text('$Result/$questionLength'),
                radius: 70,
                backgroundColor: Result == questionLength / 2
                    ? Colors.yellow
                    : Result < questionLength / 2
                        ? inCorrect
                        : correct),
            SizedBox(
              height: 10,
            ),
            Text(
              Result == questionLength / 2
                  ? 'Almost There'
                  : Result < questionLength / 2
                      ? 'Try Again'
                      : 'Great!',
              style: TextStyle(color: neutral),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: onPressed,
              child: Text(
                'Start Over',
                style: TextStyle(
                    fontSize: 18, letterSpacing: 1.0, color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
