import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:x_well/constants/ApiPath.dart';
import 'package:x_well/constants/firebase.dart';
import 'package:x_well/models/user_details.dart';
import 'package:x_well/routes/app_route_names.dart';

class ProfileController extends GetxController {

  Rxn<UserDetails> _user = new Rxn<UserDetails>();

  UserDetails? get user => _user.value;

  @override
  void onInit() {
    _user.bindStream(
        FirebaseFirestore.instance.collection(ApiPath.userCollection).doc(
            Firebase.getUID).snapshots().map((doc) => UserDetails.formDocument(doc)));
    super.onInit();
  }

  gotoAppointments(String detail) => Get.toNamed(AppRouteNames.APPOINTMENTS_SCREEN,arguments: {
    'detail': detail
  });

}