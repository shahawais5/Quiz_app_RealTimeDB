import 'package:flutter/material.dart';
import 'package:quiz_app/Constants/constants.dart';

class NextButton extends StatelessWidget {
   NextButton({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: neutral,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Text(
        'Next Question',
            textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}
