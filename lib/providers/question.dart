import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class Question {
  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correct_answer;
  final List incorrect_answers;

  Question({
    this.category,
    this.type,
    this.difficulty,
    this.question,
    this.correct_answer,
    this.incorrect_answers,
});
}

class Questions with ChangeNotifier{
  List<Question> _questions = [];
  int _index = 0;
  int get index => _index;
  List get questions => [..._questions];
  

  
  Future<void> getQuestions(String url) async{
//    var url = 'https://opentdb.com/api.php?amount=10';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      jsonResponse['results'].forEach((element) => _questions.add(
        Question(
          category: element['category'],
          type: element['type'],
          difficulty: element['difficulty'],
          question: element['question'],
          correct_answer: element['correct_answer'],
          incorrect_answers: element['incorrect_answers']
        )
      ));
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
}

  void increment(){
    _index++;
    notifyListeners();
  }

}