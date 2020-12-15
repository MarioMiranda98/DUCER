import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DucerTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onChanged;
  final bool obscureText;
  final String labelText;
  final TextInputType textInputType;
  final bool enableInteractiveSelection;
  final bool enabled;

  DucerTextField({
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.labelText = '',
    this.textInputType,
    this.enableInteractiveSelection = true,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: this.controller,
        onChanged: this.onChanged,
        obscureText: this.obscureText,
        enableInteractiveSelection: this.enableInteractiveSelection,
        enabled: this.enabled,

        decoration: InputDecoration(
          isDense: true,
          labelText: this.labelText,
          labelStyle: TextStyle(color: Colors.grey, fontSize: Get.height * 0.020),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Color(0xFF8492A6)
            ) 
          ),
        ),
        style: TextStyle(color: Colors.black, fontSize: Get.height * 0.020),
        keyboardType: this.textInputType
      ),
    );
  }
}