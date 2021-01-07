import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ducer/src/widgets/ducer_app_bar.dart';
import 'package:ducer/src/widgets/ducer_header.dart';
import 'package:ducer/src/controllers/profile_controller.dart';
import 'package:ducer/src/pages/profile_page/widgets/children_table_widget.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (_) => SafeArea(
        child: Scaffold(
          appBar: DucerAppBar(),
          body: Column(
            children: <Widget>[
              _buildHeader(),
              _buildBody(_),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: DucerHeader(
        childName: 'Vista General',
        screenName: 'Mi perfil',
      ),
    );
  }

  Widget _buildBody(ProfileController controller) {
    return Container(
      width: Get.width * 0.9,
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
      child: ListView(shrinkWrap: true, children: <Widget>[
        _buildInfoParent(controller),
        ChildrenTableWidget(),
      ]),
    );
  }

  Widget _buildInfoParent(ProfileController controller) {
    return Container(
      child: Column(children: <Widget>[
        Image.asset('assets/images/user.jpg', height: 200.0, fit: BoxFit.cover),
        Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            'Nombre: ${controller.name} ${controller.firstLastName} ${controller.secondLastName}',
            style: TextStyle(fontSize: 16),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            'Fecha de creación: ${controller.creationDate}',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ]),
    );
  }
}
