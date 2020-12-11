import 'package:ducer/src/pages/login_page.dart';
import 'package:ducer/src/widgets/ducer_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:ducer/src/widgets/ducer_app_bar.dart';
import 'package:ducer/src/widgets/ducer_card.dart';

class HomePage extends StatelessWidget {
  final item = DucerCard(
    titleCard: 'Hola mundo',
    bodyCard: 'Esse reprehenderit commodo laborum ipsum laboris ea ut incididunt. Magna tempor duis cupidatat consectetur occaecat reprehenderit ea nostrud ex.',
    buttonText: 'Ir',
    action: () => print('hola'),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: DucerAppBar(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: Get.width * 0.35),
              child: Text(
                'Bienvenido',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'Baloo'
                ),
              )
            ),
            Divider(),
            _buildCarousel(),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: DucerButton(
                colorButton: Theme.of(Get.context).primaryColor,
                colorText: Colors.white,
                text: 'Cerrar Sesión',
                width: 200.0,
                fontSize: 24,
                action: () => { Get.off(LoginPage()) },
              ),
            ),
          ],
        )
      ),
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
            items: [
              item,
              item,
              item,
              item,
              item,
              item,
            ],
          ),
        ],
      ),
    );
  }
}