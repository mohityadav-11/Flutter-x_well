import 'package:cloud_firestore/cloud_firestore.dart';

class Appointment {
  Appointment({
    this.id = '',
    this.uid = '',
    this.docId = '',
    this.time = '',
    this.type = '',
    this.category = '',
    this.date,
    this.timestamp,
    this.location ='',
    this.docName='',
  });

  String id;
  String uid;
  String docId;
  String docName;
  String category;
  String type;
  DateTime? date;
  String time;
  String location;
  dynamic timestamp;

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "docId": docId,
      "type": type,
      "date": date,
      "time": time,
      "docName": docName,
      "location": location,
      "timestamp": timestamp,
      "category": category,
    };
  }

  factory Appointment.formDocument(DocumentSnapshot doc) {
    return Appointment(
      id: doc.id,
      uid: doc.get("uid"),
      docId: doc.get("docId"),
      type: doc.get("type"),
      docName: doc.get("docName"),
      location: doc.get("location"),
      date: DateTime.fromMicrosecondsSinceEpoch(doc.get("date").microsecondsSinceEpoch),
      time: doc.get("time"),
      category: doc.get("category"),
      timestamp: doc.get("timestamp") ,
    );
  }
}
