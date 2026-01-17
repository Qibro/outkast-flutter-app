import 'package:get/get.dart';
import 'package:outkast/controllers/main/bottom_nav_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BottomNavController>(BottomNavController(), permanent: false);
  }
}
