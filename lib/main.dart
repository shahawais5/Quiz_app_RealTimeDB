import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quiz_screen.dart';

import 'package:firebase_core/firebase_core.dart';

import 'auth/sign_in.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // var db=DbConnect();
  // // db.addQuestions(Questions(id: ('12'), title: 'OOP Stands For:', options: {
  // //   'Object Oriented Programming':true,
  // //   'Object Offer Program':false,
  // //   'Object Office Programming':false,
  // //   'Object Programming ':false
  // //
  // // }));
  // db.fetchQuestions();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignIn(),
    );
  }
}


