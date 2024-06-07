import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserEditController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController subCategoryController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void updateUser(String fullNames) async {
    String newName = nameController.text.trim();
    String newCategory = categoryController.text.trim();
    String newSubCategory = subCategoryController.text.trim();
    String newPosition = positionController.text.trim();

    // Update user data in Firestore
    await _firestore
        .collection('candidates')
        .where('FullNames', isEqualTo: fullNames)
        .get()
        .then((snapshot) {
      for (var doc in snapshot.docs) {
        doc.reference.update({
          'FullNames': newName,
          'Category': newCategory,
          'SubCategory': newSubCategory,
          'NameOfPosition': newPosition,
        }).then((_) {
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
          print("ERROR - $error");
          log("ERROR - $error");
        });
      }
    });
    // 'FullNames': newName,
    // 'Category': newCategory,
    // 'SubCategory': newSubCategory,
    // 'NameOfPosition': newPosition,
    // });
  }
}
