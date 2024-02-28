import 'package:airpedia/app/modules/adminlogin/controllers/adminlogin_controller.dart';
import 'package:get/get.dart';


class AdminloginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminloginController>(AdminloginController.new);
  }
}