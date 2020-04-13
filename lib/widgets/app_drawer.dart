import 'package:flutter/material.dart';
import 'package:practicingprovider/screens/score_screen.dart';
import 'package:practicingprovider/screens/about_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              child: Column(
                children: <Widget>[
                 Container(
                   width: 100,
                   height: 100,
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     image: DecorationImage(
                       fit: BoxFit.cover,
                       image: AssetImage('assets/img/general.png'),
                     )
                   ),
                 ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      'Quiz App',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 23,
                      ),
                    ),
                  ),
                ],
              ),
            ),
//            decoration: BoxDecoration(
//              color: Color.fromRGBO(233, 236, 239, 1),
//            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            onTap: () {
              Navigator.pushNamed(context, ScoreScreen.route);
            },
          ),
          Divider(),
//          ListTile(
//            leading: Icon(Icons.settings),
//            title: Text('Setting'),
//            onTap: () {
//              Navigator.pop(context);
//            },
//          ),
//          Divider(),
          ListTile(
            leading: Icon(Icons.perm_identity),
            title: Text('About'),
            onTap: () {
              Navigator.pushNamed(context, AboutScreen.route);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
