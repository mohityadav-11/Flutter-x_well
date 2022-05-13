import 'package:get/get.dart';
import 'package:x_well/screens/home/controllers/home_controller.dart';
import 'package:x_well/screens/profile/controllers/profile_controller.dart';
import 'package:x_well/screens/tabs/controllers/tabs_controller.dart';

class TabsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(TabsController(),permanent: true);
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProfileController());
  }

}