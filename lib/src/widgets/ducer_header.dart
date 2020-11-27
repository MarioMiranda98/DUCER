import 'package:flutter/material.dart';

class DucerHeader extends StatelessWidget {
  final childName;
  final screenName;

  DucerHeader({
    this.childName,
    this.screenName
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          _buildText(childName, 18, 'Hammersmith'),
          Divider(
            thickness: 2.0,
          ),
          _buildText(screenName, 20, 'Baloo')
        ],
      ),
    );
  }

  Text _buildText(String text, double fontSize, String fontFamily) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize, 
      ),
    );
  }
}