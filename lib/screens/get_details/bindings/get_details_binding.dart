import 'package:get/get.dart';
import 'package:x_well/screens/get_details/controllers/get_details_controller.dart';

class GetDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => GetDetailsController());
  }

}