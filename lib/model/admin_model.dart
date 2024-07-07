import 'package:cloud_firestore/cloud_firestore.dart';

class AdminModel {
  String email;
  String? password;
  int? phone;
  DateTime createdAt;
  String name;
  int? status;
  String? uid;

  AdminModel(
      {required this.email,
      this.password,
      required this.name,
      this.phone,
      required this.createdAt,
      this.uid,
      this.status});

  factory AdminModel.fromJason(DocumentSnapshot data) {
    return AdminModel(
        email: data['email'],
        name: data['name'],
        phone: data['phone'],
        createdAt: data['createdAt'],
        status: data['status'],
        uid: data['uid']);
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phone":phone,
      "status": status,
      "uid": uid,
      "createdAt": createdAt
    };
  }
}
