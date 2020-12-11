import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart'; 
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:ducer/src/pages/splash_screen_page.dart';
import 'package:ducer/src/utils/helpers.dart';

void main() { 
  runApp(
    GetMaterialApp(
      title: 'Ducer',
      home: SplashScreenPage(), 
      theme: ThemeData(
        fontFamily: 'Hammersmith',
        primaryColor: Color(0xFF275850),
        accentColor: Color(0xFF1A99FA)
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
          const Locale('en', 'US'), 
          const Locale('es', 'ES'), 
      ],
    ),
  );

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  );
  Helpers.setStatusBarColor(Colors.transparent);
}