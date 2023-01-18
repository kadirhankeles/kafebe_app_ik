import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/team/team_controller.dart';

class TeamBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TeamController());
  }
}
