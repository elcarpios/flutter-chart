import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({this.title, Key key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Image(image: AssetImage('assets/tag-logo.png'), width: 180),
            SizedBox(height: 20.0),
            Text(this.title, style: TextStyle(fontSize: 30))
          ],
        ),
      ),
    );
  }
}
