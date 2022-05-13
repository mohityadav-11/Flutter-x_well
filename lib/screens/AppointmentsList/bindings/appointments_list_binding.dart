import 'package:get/get.dart';
import 'package:x_well/screens/AppointmentsList/controllers/appointments_list_controller.dart';

class AppointmentsListBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => AppointmentsListController());
  }

}