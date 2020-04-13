import 'package:flutter/material.dart';
import 'package:practicingprovider/screens/score_screen.dart';
import 'package:practicingprovider/widgets/app_drawer.dart';
import 'package:practicingprovider/widgets/grid_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class GridScreen extends StatelessWidget {

  List<Map<String, String>> data = [
    {
      'name': 'General Knowledge',
      'imageUrl': 'assets/img/general.png',
      'quizUrl': 'https://opentdb.com/api.php?amount=10&category=9&difficulty=medium&type=multiple'
    },
    {
      'name': 'Science And Nature',
      'imageUrl': 'assets/img/general.png',
      'quizUrl': 'https://opentdb.com/api.php?amount=10&category=17&difficulty=medium&type=multiple'
    },
    {
      'name': 'History',
      'imageUrl': 'assets/img/general.png',
      'quizUrl': 'https://opentdb.com/api.php?amount=10&category=23&difficulty=medium&type=multiple'
    },
    {
      'name': 'Geograpy',
      'imageUrl': 'assets/img/general.png',
      'quizUrl': 'https://opentdb.com/api.php?amount=10&category=22&difficulty=medium&type=multiple'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Quizzes'),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: GridView.builder(
          itemBuilder: (BuildContext context, int index) {
            return GridItem(
              name: data[index]['name'],
              imageUrl: data[index]['imageUrl'],
              quizUrl: data[index]['quizUrl'],
            );
          },
          itemCount: data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.5,
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
