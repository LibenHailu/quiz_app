import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/question.dart';

class Answer extends StatefulWidget {
  Answer({Key key}) : super(key: key);

  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  String _answer = '';
  Color _buttonColor = Color.fromRGBO(173, 216, 230, 1);
  List all = [];
  Color _correctColor;
  Widget build(BuildContext context) {
    final question = Provider.of<Questions>(context);
    final index = Provider.of<Questions>(context).index;
    final incorrects = question.questions[index].incorrect_answers;
    final correct = question.questions[index].correct_answer;
    final shuffled = [...?incorrects];
    shuffled.add(correct);
    shuffled.shuffle();
    if (all.isEmpty) {
      all = [...shuffled];
    }
    bool isCorrect(String check) {
      if (_correctColor != null) {
        if (check == correct) {
          return true;
        }
      }
      return false;
    }

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: <Widget>[
              Divider(
                color: Color.fromRGBO(209, 212, 215, 1),
              ),
              Container(padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),

                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Color.fromRGBO(223, 223, 223, 1),
                    ),
                    left: BorderSide(
                      color: Color.fromRGBO(223, 223, 223, 1),
                    ),
                    right: BorderSide(
                      color: Color.fromRGBO(223, 223, 223, 1),
                    ),
                  ),
                  color: isCorrect(all[0])
                      ? _correctColor
                      : _answer == all[0] ? _buttonColor : Colors.white,
                ),
                child: InkWell(
                  child: Text(
                    all[0],
                    style: Theme.of(context).textTheme.body1,
                  ),
                  onTap: () {
                    setState(() {
                      _answer = all[0];
                    });
                  },
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Color.fromRGBO(223, 223, 223, 1),
                    ),
                    left: BorderSide(
                      color: Color.fromRGBO(223, 223, 223, 1),
                    ),
                    right: BorderSide(
                      color: Color.fromRGBO(223, 223, 223, 1),
                    ),
                  ),
                  color: isCorrect(all[1])
                      ? _correctColor
                      : _answer == all[1] ? _buttonColor : Colors.white,
                ),
                child: InkWell(
                  child: Text(
                    all[1],
                    style: Theme.of(context).textTheme.body1,
                  ),
                  onTap: () {
                    setState(() {
                      _answer = all[1];
                    });
                  },
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Color.fromRGBO(223, 223, 223, 1),
                    ),
                    left: BorderSide(
                      color: Color.fromRGBO(223, 223, 223, 1),
                    ),
                    right: BorderSide(
                      color: Color.fromRGBO(223, 223, 223, 1),
                    ),
                  ),
                  color: isCorrect(all[2])
                      ? _correctColor
                      : _answer == all[2] ? _buttonColor : Colors.white,
                ),
                child: InkWell(
                  child: Text(
                    all[2],
                    style: Theme.of(context).textTheme.body1,
                  ),
                  onTap: () {
                    setState(() {
                      _answer = all[2];
                    });
                  },
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(223, 223, 223, 1),
                  ),
                  color: isCorrect(all[3])
                      ? _correctColor
                      : _answer == all[3] ? _buttonColor : Colors.white,
                ),
                child: InkWell(
                  child: Text(
                    all[3],
                    style: Theme.of(context).textTheme.body1,
                  ),
                  onTap: () {
                    setState(() {
                      _answer = all[3];
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                color: Theme.of(context).accentColor,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (_answer == correct) {
                      _buttonColor = Color.fromRGBO(144, 238, 144, 1);
                      return;
                    }
                    if (_answer != correct) {
                      _buttonColor = Color.fromRGBO(255, 125, 125, 1);
                      _correctColor = Color.fromRGBO(144, 238, 144, 1);
                      return;
                    }
                  });
                },
              ),
              RaisedButton(
                color: Color.fromRGBO(108, 191, 129, 1),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                onPressed: () {
                  if (question.questions.length > index) {
                    setState(() {
                      _answer = '';
                      _buttonColor = Color.fromRGBO(173, 216, 230, 1);
                      _correctColor = null;
                      all = [];
                    });
                    question.increment();
                  } else {}
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
