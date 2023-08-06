import 'package:flutter/material.dart';
import 'package:quiz_app/Constants/constants.dart';
import 'package:quiz_app/screens/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: background,
        title: Text(
          'Quiz App',
          style: TextStyle(color: neutral, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'What is object-oriented programming?',
              style: TextStyle(
                  color: neutral, fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            'Object-oriented programming (OOP) is a computer programming model'
            ' that organizes software design around data, or objects, rather than functions and \nlogic. '
            'An object can be defined as a data field that has unique attributes and behavior',
            style: TextStyle(
              color: neutral,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          Image.network(
            'https://teacherdada.com/blog/wp-content/uploads/2022/11/object-oriented-programming.png', // Replace with your image URL
            width: 400,
            height: 400,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizScreen()),
              );
            },
            child: Text('Get Started'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
