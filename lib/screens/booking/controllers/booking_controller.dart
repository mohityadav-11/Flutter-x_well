import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:x_well/constants/ApiPath.dart';
import 'package:x_well/constants/firebase.dart';
import 'package:x_well/helpers/confirm_dialog.dart';
import 'package:x_well/helpers/error_snack_bar.dart';
import 'package:x_well/helpers/showLoading.dart';
import 'package:x_well/models/appointment.dart';
import 'package:x_well/models/doctor.dart';
import 'package:x_well/routes/app_route_names.dart';

import '../views/select_time_view.dart';

class BookingController extends GetxController {
  late Doctor doctor;
  late String category;

  RxString _type = new RxString("");
  Rx<DateTime> _date = Rx<DateTime>(DateTime.now().add(Duration(days: 1)));
  RxString _time = new RxString("");

  bool get buttonEnabled => _time.value.isNotEmpty && _type.value.isNotEmpty;

  String get time => _time.value;

  DateTime get date => _date.value;

  String get type => _type.value;

  RxList<Appointment> _appointments = new RxList<Appointment>([]);

  List<Appointment> get appointments => _appointments;

  @override
  void onInit() {
    doctor = Get.arguments["doctor"] as Doctor;
    category = Get.arguments["category"] as String;
    FirebaseFirestore.instance
        .collection(ApiPath.appointmentsCollection)
        .snapshots()
        .listen((event) {
      _appointments.clear();
      _appointments
          .addAll(event.docs.map((doc) => Appointment.formDocument(doc)));
    });
    super.onInit();
  }

  isTimeTaken(String time) =>
      _appointments.where((app) => app.docId == doctor.docId).any((element) =>
          element.date!.day == date.day &&
          element.date!.month == date.month &&
          time == element.time && element.category == category);

  onDateChange(DateTime? dateTime) {
    _date.value = dateTime!;
  }

  selectType(String value) {
    _type.value = value;
  }

  selectTime(String value) {
    _time.value = value;
  }

  onBook() {
    print(date);
    confirmDialog();
  }

  onBookingConfirm() async {
    Appointment appointment = new Appointment(
        docId: doctor.docId,
        uid: Firebase.getUID,
        time: time,
        date: date,
        category: category,
        docName: doctor.name,
        location: doctor.address1+", "+doctor.address2+", "+doctor.city+", "+doctor.country,
        type: type,
        timestamp: DateTime.now());

    showLoading();
    await Future.delayed(Duration(milliseconds: 600));
    await FirebaseFirestore.instance
        .collection(ApiPath.appointmentsCollection)
        .doc()
        .set(appointment.toMap())
        .then((value) {
      Get.offAllNamed(AppRouteNames.TABS_SCREEN);
      successful_booking();
    }).onError((error, stackTrace) {
      Get.back();
      Get.back();
      failed_booking();
    });
  }
}
