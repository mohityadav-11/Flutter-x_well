import 'package:cloud_firestore/cloud_firestore.dart';

class VaccineDetails{

  VaccineDetails({
    this.vid = '',
    this.firstDose=false,
    this.secondDose=false,
});

  String vid;
  bool firstDose;
  bool secondDose;

  factory VaccineDetails.formDocument(DocumentSnapshot doc) {
    return VaccineDetails(
      vid: doc.id,
      firstDose: doc.get("firstDose"),
      secondDose: doc.get("secondDose"),
      // number: doc.get("number"),
      // age: doc.get("age"),
      // timestamp: doc.get("timestamp"),
      // weight: doc.get("weight"),
      // gender: doc.get("gender"),
      // bloodGroup: doc.get("bloodGroup"),
      // height: doc.get("height"),
    );
  }

}