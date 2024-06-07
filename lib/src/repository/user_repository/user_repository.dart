// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

// Store user in Firestore
  createUser(UserModel user) async {
    await _db.collection("users").add(user.toJason()).whenComplete(() {
      Get.snackbar(
        "Success!",
        "Your account has been successfully created",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
    }).catchError((error, stackTrace) {
      Get.snackbar("Error!", "Something went wrong, Try Again!",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print("ERROR - $error");
      log("ERROR - $error");
    });
  }

// get one value from db
  Future<UserModel?> getUserDetails(String email) async {
    // log("in 2");
    // log(email);
    final snapshot =
        await _db.collection("users").where("Email", isEqualTo: email).get();
    if (snapshot.docs.isNotEmpty) {
      // log("message: not empty");
      // log(snapshot.docs.toString());
      // Accessing data from the first document in the snapshot
      Map<String, dynamic>? data = snapshot.docs.first.data();
      // ignore: unnecessary_null_comparison
      if (data != null) {
        // Convert data to string and log it
        // log("Data structure: ${data.toString()}");
        // log(data["Email"]);
        return UserModel(
            fullname: data["FullName"],
            email: data["Email"],
            phoneNo: data["PhoneNo"],
            password: data["Password"]);
      }
      // log("message: ${snapshot.docs.map((doc) => UserModel.fromSnapshot(doc)).single as String}");
      return UserModel.fromSnapshot(snapshot.docs.first);
      // final userData =
      //     snapshot.docs.map((doc) => UserModel.fromSnapshot(doc)).single as UserModel;
      // log("2");
      // log(userData as String);
      // return userData;
    } else {
      // log("message: empty");
      return null;
    }
  }

// Fetch all Users or User details
  Future<List<UserModel>> allUser() async {
    List<UserModel> users = [];

    final snapshot = await _db.collection("users").get();

    if (snapshot.docs.isNotEmpty) {
      for (var doc in snapshot.docs) {
        // Access data from each document
        Map<String, dynamic> userData = doc.data();
        // log("Data structure: $userData");
        // Convert data to UserModel object
        // UserModel user = UserModel.fromSnapshot(
        //     userData as DocumentSnapshot<Map<String, dynamic>>);
        // Add user to the list
        users.add(UserModel(
            fullname: userData["FullName"],
            email: userData["Email"],
            phoneNo: userData["PhoneNo"],
            password: userData["Password"]));
      }
    }
    // log("users");
    // log(users.toString());
    return users;

    // final userData =
    //     snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    // // log("Data structure: ${data.toList(snapshot)}");
    // // Get the total number of users in the database
    // final totalUsers = snapshot.size;

    // print('Total number of users: $totalUsers');
    // return userData;
  }

  Future<List<Object>> getData() async {
    try {
      // Get the collection reference
      CollectionReference dataCollection = _db.collection('users');

      // Get the documents from the collection
      QuerySnapshot snapshot = await dataCollection.get();

      // Return the list of documents
      return snapshot.docs;
    } catch (e) {
      // Handle errors
      print('Error retrieving data: $e');
      return [];
    }
  }

  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection("users").doc(user.id).update(user.toJason());
  }
}
