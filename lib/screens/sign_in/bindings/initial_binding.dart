import 'package:get/get.dart';
import 'package:x_well/screens/sign_in/controllers/sign_in_controller.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SignInController(),permanent: true);
  }

}