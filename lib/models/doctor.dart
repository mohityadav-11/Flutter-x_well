import 'package:cloud_firestore/cloud_firestore.dart';

class Doctor {

  Doctor({
    this.docId='',
    this.name='',
    this.address1='',
    this.address2='',
    this.number=0,
    this.url='',
    this.city='',
    this.country='',
    this.rating='',
});

  String docId;
  String name;
  String address1;
  String address2;
  String city;
  int number;
  String country;
  String url;
  String rating;


  factory Doctor.formDocument(DocumentSnapshot doc) {
    return Doctor(
      docId: doc.id,
      address1: doc.get("address1"),
      name: doc.get("name"),
      number: doc.get("number"),
      address2: doc.get("address2"),
      city: doc.get("city"),
      country: doc.get("country"),
      url: doc.get("url"),
      rating: doc.get("rating"),
    );
  }


}