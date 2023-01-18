import 'package:get/get.dart';
import 'package:kafebe_app_ik/app/modules/team/team_detail/team_detail_controller.dart';

class TeamDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TeamDetailController());
  }
}
