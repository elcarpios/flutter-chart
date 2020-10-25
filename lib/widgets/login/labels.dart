import 'package:flutter/material.dart';

class LoginLabels extends StatelessWidget {
  const LoginLabels(
      {@required this.route,
      @required this.hintText,
      @required this.linkText,
      Key key})
      : super(key: key);

  final String route;
  final String hintText;
  final String linkText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            this.hintText,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w200),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, route),
            child: Text(
              this.linkText,
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
