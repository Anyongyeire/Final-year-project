import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/core/models/candidate_model.dart';

class CandidateRepository extends GetxController {
  static CandidateRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

// Store user in Firestore
  addCandidate(CandidateModel candidate) async {
    final candidateName = candidate.candidatename;

    // Check if candidate name already exists
    final querySnapshot = await _db
        .collection("candidates")
        .where("FullNames", isEqualTo: candidateName)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      Get.snackbar(
        "Error!",
        "Candidate with the same name already exists",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      return;
    }

    await _db
        .collection("candidates")
        .add(candidate.toJason())
        .whenComplete(() {
      Get.snackbar(
        "Success!",
        "Candidate successfully added",
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
      log("ERROR - $error");
    });
  }

// get one value from db
  Future<CandidateModel?> getCandidateDetails(String name) async {
    log("Candidates name: $name");
    final snapshot = await _db
        .collection("candidates")
        .where("FullNames", isEqualTo: name)
        .get();
    if (snapshot.docs.isNotEmpty) {
      log("message: not empty");
      Map<String, dynamic>? data = snapshot.docs.first.data();
      log(data["Category"]);
      log(data["SubCategory"]);
      log(data["NameOfPosition"]);
      return CandidateModel(
        category: data["Category"],
        candidatename: data["FullNames"],
        position: data["NameOfPosition"],
        subcategory: data["SubCategory"],
      );
      //     log("with data");
      // log("message: ${snapshot.docs.map((doc) => CandidateModel.fromSnapshot(doc)).single as String}");
      // return CandidateModel.fromSnapshot(snapshot.docs.first);
    } else {
      log("message: empty");
      return null;
    }
  }

  updateCandidateDetails(CandidateModel candidate) async {
    final candidateName = candidate.candidatename;
    final querySnapshot = await _db
        .collection("candidates")
        .where("FullNames", isEqualTo: candidateName)
        .get();
    log(candidate.category.trim().toString());
    log(candidate.toJason().toString().trim());
    if (querySnapshot.docs.isNotEmpty) {
      log("message: Inside if statement");
      final candidateDoc = querySnapshot.docs.first;
      await _db
          .collection("candidates")
          .doc(candidateDoc.id)
          .update(candidate.toJason())
          .whenComplete(() {
        Get.snackbar(
          "Success!",
          "Candidate successfully updated",
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
        log("ERROR - $error");
      });
    }
  }
}
