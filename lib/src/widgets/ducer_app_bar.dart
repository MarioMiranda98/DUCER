import 'package:flutter/material.dart';

class DucerAppBar extends AppBar {
  DucerAppBar({
    List<Widget> actions = const [],
  }) : super(
          title: FractionallySizedBox(
            widthFactor: 0.35,
            child: Image.asset('assets/logos/ducer.png'),
          ),
          elevation: 0,
          actions: actions,
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.black),
        );
}
