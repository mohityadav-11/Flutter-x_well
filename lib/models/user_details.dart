import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails {
  UserDetails(
      {this.userId = '',
      this.name = '',
      this.age = 0,
      this.weight = 0,
      this.height = 0,
      this.gender = '',
      this.bloodGroup = '',
      this.email = '',
      this.number = 0,
      this.timestamp});

  String userId;
  String name;
  String email;
  int age;
  int weight;
  int height;
  String gender;
  String bloodGroup;
  int number;
  dynamic timestamp;

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "name": name,
      "number": number,
      "age": age,
      "weight": weight,
      "height": height,
      "gender": gender,
      "bloodGroup": bloodGroup,
      "timestamp": timestamp
    };
  }

  factory UserDetails.formDocument(DocumentSnapshot doc) {
    return UserDetails(
      userId: doc.id,
      email: doc.get("email"),
      name: doc.get("name"),
      number: doc.get("number"),
      age: doc.get("age"),
      timestamp: doc.get("timestamp"),
      weight: doc.get("weight"),
      gender: doc.get("gender"),
      bloodGroup: doc.get("bloodGroup"),
      height: doc.get("height"),
    );
  }
}
