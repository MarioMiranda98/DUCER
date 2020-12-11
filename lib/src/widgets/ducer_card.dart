import 'package:flutter/material.dart';

class DucerCard extends StatelessWidget {
  final String titleCard;
  final String bodyCard;
  final String buttonText;
  final void Function() action;

  DucerCard({
    this.titleCard,
    this.bodyCard,
    this.buttonText,
    @required this.action
  });

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
      child: Column(
        children: <Widget>[
          _buildImage(),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text( 
                    titleCard,
                    style: TextStyle(
                      fontFamily: 'Hammersmith',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                  child: Text(
                    bodyCard,
                    style: TextStyle(
                      fontFamily: 'Baloo',
                      fontSize: 12,
                      fontWeight: FontWeight.w100,
                      color: Theme.of(context).accentColor,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      child: Text(buttonText),
                      onPressed: action,
                    ),
                  ],
                )
              ],
            ),
          ),
        ]
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      child: Container(
        child: Image.asset(
          'assets/images/landscape.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}