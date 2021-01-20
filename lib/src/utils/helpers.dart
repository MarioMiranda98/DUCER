import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

import 'package:ducer/src/utils/constants/suggestions.dart';
import 'package:ducer/src/utils/constants/tests_questions.dart';
import 'package:ducer/src/models/incidences_model.dart';
import 'package:ducer/src/utils/constants/tests_points.dart';

class Helpers {
  static void setStatusBarColor(Color color) async {
    await FlutterStatusbarcolor.setStatusBarColor(color);
    await FlutterStatusbarcolor.setNavigationBarWhiteForeground(
        useWhiteForeground(color));
  }

  static Future<DateTime> buildDatePicker() async {
    return await showRoundedDatePicker(
      context: Get.context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 10000),
      lastDate: DateTime(DateTime.now().year + 10000),
      borderRadius: 16,
      theme: ThemeData(
        primaryColor: Theme.of(Get.context).primaryColor,
        accentColor: Theme.of(Get.context).primaryColor,
        dialogBackgroundColor: Colors.grey[200],
        accentTextTheme: TextTheme(
          bodyText2: TextStyle(color: Theme.of(Get.context).primaryColor)
        )
      )
    );
  }

  static void openSnackBar(String errorTitle, String errorBody) {
    Get.snackbar(
      '',
      '',
      titleText: Text(
        errorTitle,
        style: TextStyle(
          fontFamily: 'Baloo',
          color: Theme.of(Get.context).primaryColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      messageText: Text(
        errorBody,
        style: TextStyle(
          fontFamily: 'Baloo',
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.grey.withOpacity(0.4),
      animationDuration: Duration(seconds: 5)
    );
  }

  static Map<int, List<String>> getTestsQuestions(String identifier) {
    switch (identifier) {
      case 't1':
        return kTestOne;
      case 't2':
        return kTestTwo;
      case 't3':
        return kTestThree;
      case 't4':
        return kTestFour;
      case 't5':
        return kTestFive;
      case 't6':
        return kTestSix;
      default:
        return {};
    }
  }

  static Map<String, int> getTestsPoints(String identifier) {
    switch (identifier) {
      case 't1':
        return kTestOnePoints;
      case 't2':
        return kTestTwoPoints;
      case 't3':
        return kTestThreePoints;
      case 't4':
        return kTestFourPoints;
      case 't5':
        return kTestFivePoints;
      case 't6':
        return kTestSixPoints;
      default:
        return {};
    }
  }

  static Map<String, dynamic> getNewValues(List<IncidencesModel>incidenceName, Map<String, dynamic> map) {
    for(int i = 0; i < incidenceName.length; i++) {
      if(incidenceName[i].incidenceName == 'Se siente observado')
        map['feeling_watched'] = map['feeling_watched'] + 1;
      else if(incidenceName[i].incidenceName == 'Le cuesta comunicarse')
        map['communiaction_trouble'] = map['communiaction_trouble'] + 1;
      else if(incidenceName[i].incidenceName == 'Se nota ansioso')
        map['anxious'] = map['anxious'] + 1;
      else if(incidenceName[i].incidenceName == 'Se nota triste')
        map['sad'] = map['sad'] + 1;
      else if(incidenceName[i].incidenceName == 'Señal física anormal')
        map['anormal_physyc_signal'] = map['anormal_physyc_signal'] + 1;
      else if(incidenceName[i].incidenceName == 'Se aísla')
        map['isolate'] = map['isolate'] + 1;
      else if(incidenceName[i].incidenceName == 'Poca atención')
        map['lack_attention'] = map['lack_attention'] + 1;
      else if(incidenceName[i].incidenceName == 'Rabietas')
        map['tantrums'] = map['tantrums'] + 1;
      else if(incidenceName[i].incidenceName == 'Agresión')
        map['aggressions'] = map['aggressions'] + 1;
      else if(incidenceName[i].incidenceName == 'Problematico en su entorno')
        map['problematic_enviroment'] = map['problematic_enviroment'] + 1;
    }

    return map;
  }

  static String getResults(String testIdentifier, Map<String, int> results) {
    final testPoints = Helpers.getTestsPoints(testIdentifier);
    String aux = '';

    if(results['er'] == 0 && results['ad'] == 0 && results['cc'] == 0 && 
       results['as'] == 0 && results['pa'] == 0 && results['ca'] == 0) {
      
      return 'El niño se encuntra con sanidad y sin problema alguno. ¡Felicidades!';
    }

    if(results['er'] > 0 && results['er'] < testPoints['er']) 
      aux += 'Hay una leve probabiidad de que sea Emocionalmente Reactivo, ';
    else if(results['er'] == testPoints['er']) 
      aux += 'Probablemente es Emocionalmente Reactivo, ';

    if(results['ad'] > 0 && results['ad'] < testPoints['ad']) 
      aux += 'hay una leve probabiidad de que sea Ansioso o Depresivo, ';
    else if(results['ad'] == testPoints['ad']) 
      aux += 'probablemente es Ansioso o Depresivo, ';

    if(results['cc'] > 0 && results['cc'] < testPoints['cc']) 
      aux += 'hay una leve probabiidad de que tenga problemas de comportamiento, ';
    else if(results['cc'] == testPoints['cc']) 
      aux += 'probablemente tiene problemas de comportamiento, ';

    if(results['as'] > 0 && results['as'] < testPoints['as']) 
      aux += 'hay una leve probabiidad de que se aisle, ';
    else if(results['as'] == testPoints['as']) 
      aux += 'probablemente se aisla, ';

    if(results['pa'] > 0 && results['pa'] < testPoints['pa']) 
      aux += 'hay una leve probabiidad de que tenga problemas de atención, ';
    else if(results['pa'] == testPoints['pa']) 
      aux += 'probablemente tiene problemas de atención, ';
    
    if(results['ca'] > 0 && results['ca'] < testPoints['ca']) 
      aux += 'hay una leve probabilidad de que tenga comportamientos agresivos';
    else if(results['ca'] == testPoints['ca']) 
      aux += 'probablemente tiene comportamientos agresivos';

    return aux;
  }

  static String getImage(Map<String, int> results) {
    if(results['er'] == 0 && results['ad'] == 0 && results['cc'] == 0 && 
       results['as'] == 0 && results['pa'] == 0 && results['ca'] == 0) {
      
      return 'assets/images/feliz.png';
    } else return 'assets/images/preocupado.png';
  }

  static String getSuggestion(int qoi) {
    if(qoi < 16) return kGoodSuggestion;
    if(qoi < 30) return kRegularSuggestion;
    if(qoi >= 30) return kBadSuggestion;
    return '';
  }
}