import 'package:flutter/material.dart';
import 'package:practicingprovider/providers/question.dart';
import 'package:practicingprovider/screens/loader_screen.dart';
import 'package:provider/provider.dart';

class GridItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String quizUrl;
  GridItem({this.name, this.imageUrl,this.quizUrl});
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        child: GridTile(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
              color: Colors.black38,
            ),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, HomePage.route,arguments: quizUrl);
        },
    );
  }
}
