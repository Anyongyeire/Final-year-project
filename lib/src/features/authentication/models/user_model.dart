import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullname;
  final String email;
  // final String stdNo;
  final String phoneNo;
  final String password;

  const UserModel({
    this.id,
    required this.fullname,
    required this.email,
    // required this.stdNo,
    required this.phoneNo,
    required this.password,
  });

  toJason() {
    return {
      "Email": email,
      "FullName": fullname,
      "Password": password,
      "PhoneNo": phoneNo,
    };
  }

  /// Mapp user fetched from the Firebase to usermodel
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data["Email"],
      password: data["Password"],
      fullname: data["Fullname"],
      phoneNo: data["PhoneNo"],
      // stdNo: data["StdNo"],
    );
  }
}
