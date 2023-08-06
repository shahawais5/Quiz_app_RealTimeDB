import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_app/model/question_model.dart';

class DbConnect {
  final url = Uri.parse(
      'https://quizapp-5b42c-default-rtdb.firebaseio.com/questions.json');
  // Future<void> addQuestions(Questions questions) async {
  //   http.post(url,
  //       body: json.encode({'title': questions.title, 'options': questions.options}));
  // }
  Future<List<Questions>> fetchQuestions()async{
    List<Questions> newQuestions=[];
    //got the data by using this
    return http.get(url).then((response){
      //the method returns the 'response' which is our data
      //to what inside we have to decide it first
      var data=jsonDecode(response.body) as Map<String, dynamic>;
      data.forEach((key, value) {
        var newQuestion=Questions(id: key, title: value['title'], options: Map.castFrom(value['options']));
        newQuestions.add(newQuestion);
      });
      return newQuestions;
      // print(newQuestions);
    });
  }
}
