import 'package:flutter/material.dart';

class DucerButton extends StatelessWidget {
  final String text;
  final double margin;
  final double padding;
  final void Function() action;
  final double width;
  final Color colorText;
  final Color colorButton;
  final double fontSize;

  DucerButton({
    this.text = 'default text',
    this.margin = 20.0,
    this.padding = 20.0,
    this.fontSize = 16.0,
    this.width,
    this.colorText,
    this.colorButton,
    @required this.action
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: this.action,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        child: Text(this.text,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'Baloo',
            color: colorText,
            fontWeight: FontWeight.w500
          ),
          textAlign: TextAlign.center,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(1)),
          color: colorButton.withOpacity(1),
        ),

        width: this.width,
        padding: EdgeInsets.symmetric(vertical: 5),
        margin: EdgeInsets.symmetric(horizontal: margin),
      ),
    );
  }
}