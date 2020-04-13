import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScoreScreen extends StatefulWidget {
  static const route = '/score';
  @override
  ScoreScreenState createState() => ScoreScreenState();
}

class ScoreScreenState extends State<ScoreScreen> {
  String difficulty = '';
  String questionsAmount = '10';
  @override
  void initState() {
    super.initState();
    restore();
  }
  restore() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    setState(() {
      difficulty =
          (sharedPrefs.getString('difficulty') ?? '');
      questionsAmount = (sharedPrefs.getString('questionAmount') ?? '10');
    });
  }
  String returner(){
    restore();
    return questionsAmount;
  }

  save(String key, dynamic value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    if (value is String) {
      sharedPrefs.setString(key, value);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Score'),
      ),
      body: Column(
       children: <Widget>[









         Container(
           margin: EdgeInsets.symmetric(vertical: 20),
           child: Column(
             children: <Widget>[
               Row(
                 children: <Widget>[
                   Expanded(
                     flex: 1,
                     child: Padding(
                         padding: EdgeInsets.symmetric(horizontal: 20),
                         child: Icon(Icons.confirmation_number)),
                   ),
                   Expanded(
                     flex: 11,
                     child: Padding(
                       padding: EdgeInsets.symmetric(horizontal: 30),
                       child: Text(
                         'Number of Questions',
                         style: TextStyle(
                           fontSize: 22,
                           color: Colors.black,
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
               Column(
                 children: <Widget>[

                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 30),
                     child: RadioListTile<String>(
                       title: const Text('10'),
                       value: '10',
                       groupValue: questionsAmount,
                       onChanged: (String value) {
                         setState(() {
                           questionsAmount = value;
                         });
                         save('questionAmount', value);
                       },
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 30),
                     child: RadioListTile<String>(
                       title: const Text('20'),
                       value: '20',
                       groupValue: questionsAmount,
                       onChanged: (String value) {
                         setState(() {
                           questionsAmount = value;
                         });
                         save('questionAmount', value);
                       },
                     ),
                   ),


                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 30),
                     child: RadioListTile<String>(
                       title: const Text('30'),
                       value: '30',
                       groupValue: questionsAmount,
                       onChanged: (String value) {
                         setState(() {
                           questionsAmount = value;
                         });
                         save('questionAmount', value);
                       },
                     ),
                   ),


                 ],
               ),
             ],
           ),




         ),
























         Container(
           margin: EdgeInsets.symmetric(vertical: 20),
           child: Column(
             children: <Widget>[
               Row(
                 children: <Widget>[
                   new Expanded(
                     flex: 1,
                     child: const Icon(Icons.class_),
                   ),
                   Expanded(
                     flex: 11,
                     child: Text(
                       'Select difficulty',
                       style: TextStyle(
                         fontSize: 22,
                         color: Colors.black,
                       ),
                     ),
                   ),
                 ],
               ),
               Row(
                 children: <Widget>[
//                   const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                   Expanded(
                     flex: 2,
                     child: RadioListTile<String>(
                       title: const Text('Any Difficulty'),
                       value: '',
                       groupValue: difficulty,
                       onChanged: (String value) {
                         setState(() {
                           difficulty = value;
                         });
                         save('difficulty', value);
                       },
                     ),
                   ),
                   Expanded(
                     flex: 2,
                     child: new RadioListTile<String>(
                       title: const Text('Easy'),
                       value: 'easy',
                       groupValue: difficulty,
                       onChanged: (String value) {
                         setState(() {
                           difficulty = value;
                         });
                         save('difficulty', value);
                       },
                     ),
                   ),
//                   const Padding(padding: EdgeInsets.symmetric(horizontal: 12.0)),
                 ],
               ),Row(
                 children: <Widget>[
//                   const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                   Expanded(
                     flex: 2,
                     child: RadioListTile<String>(
                       title: const Text('Medium'),
                       value: 'medium',
                       groupValue: difficulty,
                       onChanged: (String value) {
                         setState(() {
                           difficulty = value;
                         });
                         save('difficulty', value);
                       },
                     ),
                   ),
                   Expanded(
                     flex: 2,
                     child: new RadioListTile<String>(
                       title: const Text('Hard'),
                       value: 'hard',
                       groupValue: difficulty,
                       onChanged: (String value) {
                         setState(() {
                           difficulty = value;
                         });
                         save('difficulty', value);
                       },
                     ),
                   ),
//                   const Padding(padding: EdgeInsets.symmetric(horizontal: 12.0)),
                 ],
               ),
             ],
           ),




         ),
































       ],
      ),



    );
  }
}
