import 'package:flutter/material.dart';
import '../widgets/question.dart';
import '../widgets/answer.dart';
import 'package:provider/provider.dart';
import '../providers/question.dart';

class HomePage extends StatelessWidget {
  static const route = '/quiz';
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    final questions = Provider.of<Questions>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Quiz'),
      ),
      body:FutureBuilder(
          future: questions.getQuestions(args),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
              );
            }
            if (snapshot.hasError) {
              return Text(
                'Error:\n\n${snapshot.error}',
                textAlign: TextAlign.center,
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CurrentQuestion(),
                  Answer(),
                ],
              ),
            );
          },
        ),
    );
  }
}
