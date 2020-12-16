import 'package:flutter/material.dart';
import 'package:ducer/src/widgets/ducer_button.dart';
import 'package:get/get.dart';

class DucerCard extends StatelessWidget {
  final String titleCard;
  final String bodyCard;
  final String buttonText;
  final String sourceImg;
  final void Function() action;

  DucerCard(
      {this.titleCard,
      this.bodyCard,
      this.buttonText,
      this.sourceImg,
      @required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            spreadRadius: 3,
          )
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: <Widget>[
        _buildImage(),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 20.0),
                child: Text(
                  titleCard,
                  style: TextStyle(
                    fontFamily: 'Hammersmith',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 10.0),
                child: Text(
                  bodyCard,
                  style: TextStyle(
                    fontFamily: 'Baloo',
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DucerButton(
                    colorButton: Theme.of(Get.context).primaryColor,
                    colorText: Colors.white,
                    text: buttonText,
                    width: 250.0,
                    fontSize: 22,
                    action: () => action,
                  ),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      child: Container(
        child: Image.asset(
          sourceImg,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}
