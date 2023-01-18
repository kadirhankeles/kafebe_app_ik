import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/team/team_detail/team_detail_controller.dart';

class TeamDetailScreen extends GetView<TeamDetailController> {
  const TeamDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F5FA),
      appBar: AppBar(
        title: Text("Ekibim"),
        backgroundColor: Color(0xff7f0000),
        centerTitle: true,
        
      ),
    );
  }
}