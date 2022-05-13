import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:x_well/constants/ApiPath.dart';
import 'package:x_well/models/doctor.dart';
import 'package:x_well/routes/app_route_names.dart';

class DoctorsController extends GetxController {
  late String category;

  Rx<List<Doctor>> _doctors = new Rx<List<Doctor>>([]);
  Rxn<QuerySnapshot> _snapshot = new Rxn<QuerySnapshot>();
  List<Doctor> get doctors => _doctors.value;

  RxBool _isLoading = new RxBool(true);
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    category = Get.arguments["category"] as String;
    FirebaseFirestore.instance
        .collection(ApiPath.doctorsCollection)
        .snapshots().listen((event) {
          _snapshot.value = event;
    });
    ever(_snapshot, fetchRecords);
    super.onInit();
  }

  fetchRecords(QuerySnapshot? snapshot) {
    if(snapshot!=null){
      _doctors.value.clear();
      snapshot.docs.forEach((element) {
        _doctors.value.add(Doctor.formDocument(element));
      });
    }
    _isLoading.value = false;
  }

  gotoBookingScreen(Doctor doctor) => Get.toNamed(AppRouteNames.BOOKING_SCREEN,arguments: {
    "doctor": doctor,
    "category": category
  });

  @override
  void onReady() {
    super.onReady();
  }

}
