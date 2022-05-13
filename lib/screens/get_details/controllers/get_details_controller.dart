import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:x_well/constants/firebase.dart';
import 'package:x_well/helpers/error_snack_bar.dart';
import 'package:x_well/helpers/showLoading.dart';
import 'package:x_well/models/user_details.dart';
import 'package:x_well/routes/app_route_names.dart';

class GetDetailsController extends GetxController {

  RxString _name = new RxString("");
  RxInt _age = new RxInt(18);
  RxInt _weight = new RxInt(50);
  RxInt _height = new RxInt(140);
  RxString _number = new RxString("");
  RxString _gender = new RxString("");
  RxString _bloodGroup = new RxString("");


  int get weight => _weight.value;
  int get height => _height.value;
  int get age => _age.value;
  String get gender => _gender.value;
  String get bloodGroup => _bloodGroup.value;

  bool get isEnabled => _gender.value.isNotEmpty &&
      _name.value.isNotEmpty &&
          _number.value.isNotEmpty && _bloodGroup.value.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
  }

  onNameChange(String value) => _name.value = value;

  onAgeChange(int value) => _age.value = value;
  onWeightChange(int value) => _weight.value = value;
  onHeightChange(int value) => _height.value = value;
  onGenderChange(String value) => _gender.value = value;
  onBloodGroupChange(String value) => _bloodGroup.value = value;

  onNumberChange(String value) => _number.value = value;

  onClick() async {
    if (_age.value > 99) {
      errorSnackBar("Age should be less than 100");
    } else if (_number.value.length != 10) {
      errorSnackBar("Phone number should be of 10 digits.");
    } else {
      showLoading();
      UserDetails _user = new UserDetails(
        email: FirebaseAuth.instance.currentUser!.email!,
          name: _name.value,
          age: age,
          weight: weight,
          height: height,
          gender: gender,
          bloodGroup: bloodGroup,
          number: int.parse(_number.value),
          timestamp: DateTime.now()
      );

      await Firebase.saveUserDetails(user: _user);

      dismissLoading();
      Get.offAllNamed(AppRouteNames.TABS_SCREEN);
    }
  }

}