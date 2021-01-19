import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/data/services/test_result_service.dart';
import 'package:ducer/src/utils/helpers.dart';
import 'package:ducer/src/pages/home_page.dart';
import 'package:ducer/src/widgets/ducer_header.dart';
import 'package:ducer/src/widgets/ducer_button.dart';
import 'package:ducer/src/widgets/ducer_app_bar.dart';
import 'package:ducer/src/controllers/available_test_controller.dart';
import 'package:ducer/src/data/services/secure_storage_service.dart';

// ignore: must_be_immutable
class ResultTestPage extends StatelessWidget {
  final String testName;
  final String testIdentifier;
  final Map<String, int> results;

  ResultTestPage({
    this.testName,
    this.testIdentifier,
    this.results,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (_) => SafeArea(
        child: Scaffold(
          appBar: DucerAppBar(),
          body: Column(
            children: <Widget> [
              _buildHeader(),
              Container(
                width: Get.width * 0.9,
                height: Get.height * 0.7,
                child: ListView(
                  shrinkWrap:true,
                  children: [
                    _buildImage(),
                    _buildText(),
                    _buildButton(),
                    SizedBox(height: 10.0)
                  ]
                ),
              )
            ]
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: DucerHeader(
        childName: 'Test realizado: $testName',
        screenName: 'Resultado',
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      height: Get.height * 0.3,
      child: Image.asset(
        _getImage(),
      ),
    );
  }

  Widget _buildText() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      width: Get.width * 0.9,
      child: Text(
        _getResults(),
        style: TextStyle(
          fontSize: 18
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildButton() {
    final controller = Get.put(AvailableTestController());

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: DucerButton(
        action: () => { 
          _makeRegister(controller.childName),
          Get.off(
            HomePage(), 
            transition: Transition.fadeIn
          ) 
        },
        colorButton: Theme.of(Get.context).primaryColor,
        colorText: Colors.white,
        fontSize: 24.0,
        text: 'Aceptar',
        width: Get.width * 0.9,
      ),
    );
  }

  String _getResults() {
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
      aux += 'hay una leve probabiidad de que tenga comportamientos agresivos';
    else if(results['ca'] == testPoints['ca']) 
      aux += 'probablemente tiene comportamientos agresivos';

    return aux;
  }

  String _getImage() {
    if(results['er'] == 0 && results['ad'] == 0 && results['cc'] == 0 && 
       results['as'] == 0 && results['pa'] == 0 && results['ca'] == 0) {
      
      return 'assets/images/feliz.png';
    } else return 'assets/images/preocupado.png';
  }

  void _makeRegister(String childName) async {
    final userEmail = await SecureStorageService.instance.getUserEmail();
    final time = DateTime.now();
    final date = time.toString().split(' ')[0];

    final values = {
      'email' : userEmail,
      'name': childName.split(' ')[0],
      'first_last_name': childName.split(' ')[1],
      'second_last_name': childName.split(' ')[2],
      'test_name': testName,
      'make_date': date,
      'result': _getResults()
    };

    final testResultService = TestResultService.instance;
    final res = await testResultService.registerTest(
      body: values,
    );

    if(res > 0) {
      Helpers.openSnackBar('Exito', 'El test fue registrado');
    } else {
      Helpers.openSnackBar('Error', 'No se pudo registrar el test');
    }
  }
}