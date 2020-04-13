import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/question.dart';
class CurrentQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final question = Provider.of<Questions>(context);
    print(question.questions);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 24),
      child: Text(
          question.questions[question.index].question,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
