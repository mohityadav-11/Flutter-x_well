import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:x_well/constants/ApiPath.dart';
import 'package:x_well/constants/firebase.dart';
import 'package:x_well/models/appointment.dart';
import 'package:x_well/models/vaccine_details.dart';
import 'package:x_well/routes/app_route_names.dart';

class HomeController extends GetxController {
  RxBool _loading = new RxBool(true);

  bool get loading => _loading.value;
  Rxn<VaccineDetails> _vaccine = new Rxn<VaccineDetails>();

  VaccineDetails? get vaccine => _vaccine.value;

  RxList<Appointment> _appointments = new RxList<Appointment>([]);
  List<Appointment> get appointments => _appointments;


  @override
  void onInit() {
    _vaccine.bindStream(FirebaseFirestore.instance
        .collection(ApiPath.vaccineCollection)
        .doc(Firebase.getUID)
        .snapshots()
        .map((event) => event.exists
            ? VaccineDetails.formDocument(event)
            : VaccineDetails()));

    _appointments.bindStream(FirebaseFirestore.instance
        .collection(ApiPath.appointmentsCollection)
        .where("uid", isEqualTo: Firebase.getUID)
        .snapshots().map((event) => event.docs.map((e) => Appointment.formDocument(e)).toList()));
    ever(_appointments, updateList);
    super.onInit();
  }

  updateList(List<Appointment> list) {
    DateTime date = DateTime.now();
    list.removeWhere((element) =>
    element.date!.day < date.day && element.date!.month <= date.month);
    list.sort((a, b) => a.date!.compareTo(b.date!));

  }

  gotoDoctorsScreen(String category) =>
      Get.toNamed(AppRouteNames.DOCTORS_SCREEN,
          arguments: {"category": category});

  @override
  void onReady() {
    _loading.value = false;
    super.onReady();
  }
}
