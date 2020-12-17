import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LightWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          _buildGreenLight(),
          _buildYellowLight(),
          _buildRedLight(),
        ]
      ),
    );
  }

  Widget _buildGreenLight() {
    return Container(
      width: Get.width * 0.3,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topLeft: Radius.circular(10)
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Verde',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Container(
            height: 105.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.green
              ),
              borderRadius: BorderRadius.circular(60),
              color: Colors.green[300]
            ),
          ),
          Text(
            'Buena conducta',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildYellowLight() {
    return Container(
      width: Get.width * 0.3,
      decoration: BoxDecoration(
        border: Border.all(),
      ),
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Amarillo',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Container(
            height: 105.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.yellow
              ),
              borderRadius: BorderRadius.circular(60),
              color: Colors.yellow[300]
            ),
          ),
          Text(
            'Conducta Regular',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRedLight() {
    return Container(
      width: Get.width * 0.3,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(10)
        )
      ),
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Rojo',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Container(
            height: 105.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red
              ),
              borderRadius: BorderRadius.circular(60),
              color: Colors.red[300]
            ),
          ),
          Text(
            'Conducta Mala',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}