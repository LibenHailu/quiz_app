import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const route = '/about';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('About'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin:EdgeInsets.only(top: 50),
              width: 100,
              height: 100,
              child: Image.asset(
                'assets/img/general.png',
                fit: BoxFit.cover,
              ),
            ),
            Text('Quiz',style: TextStyle(
              fontSize: 23,
              color: Colors.black,
              fontWeight: FontWeight.w500
            ),),Container(
              padding: EdgeInsets.only(bottom: 30),
              child: Text('Version 0.0.1',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300
              ),),
            ),

            ListTile(
              leading: Icon(Icons.star),
              title: Text('Rate US'),
            ),ListTile(
              leading: Icon(Icons.restore),
              title: Text('Update The App'),
            ),ListTile(
              leading: Icon(Icons.featured_play_list),
              title: Text('Terms of Service'),
            ),ListTile(
              leading: Icon(Icons.info),
              title: Text('Support'),
            ),

            Container(
              margin: EdgeInsets.only(top: 15),
              child: Center(
                child: Center(
                  child: Text('Developed by',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                  ),
                  ),
                ),
              ),
            ),Text('Liben Hailu',style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w600
            ),
            ),
          ],
        ),
      ),
    );
  }
}
