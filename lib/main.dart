import 'package:flutter/material.dart';
import 'package:practicingprovider/providers/question.dart';
import 'package:practicingprovider/screens/about_screen.dart';
import 'package:practicingprovider/screens/grid_screen.dart';
import 'package:practicingprovider/screens/loader_screen.dart';
import 'package:practicingprovider/screens/score_screen.dart';
//import 'package:practicingprovider/screens/loader_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Questions>(
      create: (_) => Questions(),
      child: MaterialApp(
      title: 'Quiz App',
        theme: ThemeData(
            primaryColor: Color.fromRGBO(233, 236, 239, 1),
            accentColor: Color.fromRGBO(82,163,249,1),
            textTheme: TextTheme(
              body1: TextStyle(color: Color.fromRGBO(51, 51, 110, 1), fontSize: 25),
              title: TextStyle(
                fontSize: 25,
                color: Color.fromRGBO(51, 51, 51, 1),
              ),
            ),
          canvasColor: Color.fromRGBO(233, 236, 239, 1),
        ),
        home: GridScreen(),
//      ChangeNotifierProvider<Questions>(
//        create: (_) => Questions(),
//        child: GridScreen(),
//      ),
//      initialRoute: '/',
        routes: {
//         '/': (context) => GridScreen(),
          HomePage.route : (context) => HomePage(),
          ScoreScreen.route : (_) => ScoreScreen(),
          AboutScreen.route:(_) => AboutScreen(),
        },
      ),
    );
  }
}
