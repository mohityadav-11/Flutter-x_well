import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants/ApiPath.dart';
import '../../../constants/firebase.dart';
import '../../../models/appointment.dart';

class AppointmentsListController extends GetxController {
  late String detail;

  RxList<Appointment> _appointments = new RxList<Appointment>([]);

  List<Appointment> get appointments => _appointments;

  @override
  void onInit() {
    detail = Get.arguments['detail'] as String;
    _appointments.bindStream(FirebaseFirestore.instance
        .collection(ApiPath.appointmentsCollection)
        .where("uid", isEqualTo: Firebase.getUID)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => Appointment.formDocument(e)).toList()));
    ever(_appointments, updateList);
    super.onInit();
  }

  updateList(List<Appointment> list) {
    DateTime date = DateTime.now();
    if(detail == "Upcoming"){
      list.sort((a, b) => a.date!.compareTo(b.date!));
      list.removeWhere((element) =>
      element.date!.day < date.day && element.date!.month <= date.month);
    } else {
      list.sort((a, b) => b.date!.compareTo(a.date!));
      list.removeWhere((element) =>
      element.date!.day >= date.day && element.date!.month >= date.month);
    }

  }
}
