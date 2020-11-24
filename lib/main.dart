import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

import 'package:ducer/src/pages/main_page.dart';

void main() => runApp(
  GetMaterialApp(
    title: 'Ducer',
    home: MainPage(), 
    theme: ThemeData(
      fontFamily: 'Hammersmith',
      primaryColor: Color(0xFF44B6AB),
    ),
    debugShowCheckedModeBanner: false,
  )
);