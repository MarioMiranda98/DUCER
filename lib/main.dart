import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

import 'package:ducer/src/pages/splash_screen_page.dart';

void main() => runApp(
  GetMaterialApp(
    title: 'Ducer',
    home: SplashScreenPage(), 
    theme: ThemeData(
      fontFamily: 'Hammersmith',
      primaryColor: Color(0xFFFFFFFF),
    ),
    debugShowCheckedModeBanner: false,
  )
);