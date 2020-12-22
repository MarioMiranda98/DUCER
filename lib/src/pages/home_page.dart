import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:ducer/src/widgets/ducer_app_bar.dart';
import 'package:ducer/src/widgets/ducer_card.dart';
import 'package:ducer/src/pages/login_page.dart';
import 'package:ducer/src/widgets/ducer_button.dart';
import 'package:ducer/src/pages/dashboard/dashboard_page.dart';
import 'package:ducer/src/pages/register_incidence/register_incidence_page.dart';
import 'package:ducer/src/pages/register_child/register_child_page.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  List<DucerCard> _ducerCards = [
    DucerCard(
      titleCard: 'Regitrar Niño',
      bodyCard: 'Realiza el registro del niño que deseas darle seguimiento.',
      buttonText: 'Dar de alta',
      sourceImg: 'assets/images/test.jpg',
      action: () => { Get.to(RegisterChildPage()) },
    ),
    DucerCard(
      titleCard: 'Registrar Incidencia',
      bodyCard: '¿Alguna conducta extraña ha ocurrido? Registralo aquí.',
      buttonText: 'Registrar',
      sourceImg: 'assets/images/landscape.jpg',
      action: () => { Get.to(RegisterIncidencePage()) },
    ),
    DucerCard(
      titleCard: 'Estatus',
      bodyCard: 'Resultados del sistema DUCER. Verifica el estatus del menor.',
      buttonText: 'Ver',
      sourceImg: 'assets/images/estatus.jpg',
      action: () => { Get.to(DashboardPage()) },
    ),
    DucerCard(
      titleCard: 'Realizar test',
      bodyCard: 'Realiza test que ayudarán a pre-evaluar la situación del menor.',
      buttonText: 'Realizar',
      sourceImg: 'assets/images/test.jpg',
      action: () => { print('Test') },
    ),
     DucerCard(
      titleCard: 'Mi perfil',
      bodyCard: 'Observa tu perfil y niños asociados a él.',
      buttonText: 'Ver',
      sourceImg: 'assets/images/test.jpg',
      action: () => { print('Perfil') },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: DucerAppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: Get.width * 0.35),
                    child: Text(
                      'Bienvenido',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          fontFamily: 'Baloo'),
                    )),
                Divider(),
                _buildCarousel(),
                Padding(
                  padding: const EdgeInsets.only(top: 45.0),
                  child: DucerButton(
                    colorButton: Theme.of(Get.context).primaryColor,
                    colorText: Colors.white,
                    text: 'Cerrar Sesión',
                    width: Get.width * 0.9,
                    fontSize: 24,
                    action: () => {Get.off(LoginPage())},
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildCarousel() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              initialPage: 0,
              autoPlay: false,
              aspectRatio: 1.0,
            ),
            items: _ducerCards,
          ),
        ],
      ),
    );
  }
}
