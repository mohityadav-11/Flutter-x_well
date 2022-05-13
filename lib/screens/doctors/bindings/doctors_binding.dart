import 'package:get/get.dart';
import 'package:x_well/screens/doctors/controllers/doctors_controller.dart';

class DoctorsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorsController());
  }

}