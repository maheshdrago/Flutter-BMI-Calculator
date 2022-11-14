import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {

  final Icon icon;
  final String text;

  IconWidget({this.icon,this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        SizedBox(
          height: 20,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 16,
              color: Color(0xFF8D8E98)
          ),
        )
      ],
    );
  }
}
