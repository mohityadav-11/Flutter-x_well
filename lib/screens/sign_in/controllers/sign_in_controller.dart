import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:x_well/constants/ApiPath.dart';
import 'package:x_well/constants/firebase.dart';
import 'package:x_well/routes/app_route_names.dart';

import '../../../helpers/LoadingDialog.dart';


class SignInController extends GetxController {
  RxBool signedIn = new RxBool(false);

  /// firebase instance object
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool _isLoading = new RxBool(true);
  bool get isLoading => _isLoading.value;

  /// google instance object
  late GoogleSignIn googleSignIn;

  @override
  void onInit() {
    /// initialize google sign in
    googleSignIn = new GoogleSignIn();
    super.onInit();
  }

  @override
  void onReady() async {
    ever(signedIn, onAuthChanged);

    signedIn.value = await _auth.currentUser != null;
    _auth.authStateChanges().listen((event) {
      signedIn.value = event?.uid != null;
    });
    super.onReady();
  }


  onAuthChanged(callback) async {
    if(signedIn.isFalse)
      _isLoading.value=false;
    if (callback) {
      FirebaseFirestore.instance.collection(ApiPath.userCollection).doc(Firebase.getUID).get().then((value) async {
        if(value.exists){
          Get.offAllNamed(AppRouteNames.TABS_SCREEN);
        } else {
          await Future.delayed(Duration(milliseconds: 900));
          Get.offAndToNamed(AppRouteNames.GET_DETAILS_SCREEN);
        }
      });
    } else {
      await Future.delayed(Duration(milliseconds: 900));
    }
  }

  /// google sign in method
  Future<void> googleSignInMethod() async {
    try {
      _isLoading.value=true;
      /// initiate google sign in
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount == null) {
        print("ERROR");
        _isLoading.value=false;
      } else {
        GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        /// get google  auth credentials
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        /// sign in with google credentials
        await _auth.signInWithCredential(credential);
      }
    } catch (err) {
      _isLoading.value=false;
    }
  }

  /// sign out method
  Future<void> signOut() async {

    Get.dialog(
      LoadingDialog(text: "Signing Out..."),
      useSafeArea: true,
      barrierDismissible: false,
    );

    /// disconnect google instance object
    await googleSignIn.disconnect();
    await Future.delayed(Duration(microseconds: 600));
    /// sign out user from firebase
    await _auth.signOut();

    Get.offAllNamed(AppRouteNames.INITIAL);
  }

}
