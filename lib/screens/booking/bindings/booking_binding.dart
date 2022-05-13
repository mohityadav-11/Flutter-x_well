import 'package:get/get.dart';
import 'package:x_well/screens/booking/controllers/booking_controller.dart';

class BookingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BookingController());
  }

}