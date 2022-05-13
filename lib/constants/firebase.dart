import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:x_well/models/user_details.dart';

import 'ApiPath.dart';

class Firebase{

  static FirebaseAuth _auth = FirebaseAuth.instance;
  static FirebaseFirestore _fire_store = FirebaseFirestore.instance;

  static String get getUID => _auth.currentUser!.uid;

  static String get email => _auth.currentUser!.email!;

  static Future<void> saveUserDetails({required UserDetails user}) async {
    await FirebaseFirestore.instance.collection(ApiPath.userCollection).doc(
        Firebase.getUID).set(user.toMap());
  }
}