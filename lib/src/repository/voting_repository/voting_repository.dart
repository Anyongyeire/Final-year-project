import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:login_app/droidcon_exporter.dart';

class VotingRepository {
  Future<void> submitVote(String userId, String category, String subCategory,
      String candidateId) async {
    await FirebaseFirestore.instance.collection('votes').add({
      'voterEmail': userId,
      'Category': category,
      'SubCategory': subCategory,
      'CandidateName': candidateId,
      'TimeStamp': Timestamp.now(),
    }).whenComplete(() {
      Get.snackbar(
        "Success!",
        "Your has been successfully for $candidateId",
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
    });

    // Optionally, update user status to indicate that they have voted in this category
  }

  Future<bool> checkIfVoted(
    String userId,
    String category,
    String subCategory,
  ) async {
    if (subCategory == 'None') {
      QuerySnapshot query = await FirebaseFirestore.instance
          .collection('votes')
          .where('voterEmail', isEqualTo: userId)
          .where('Category', isEqualTo: category)
          .get();

      return query.docs.isNotEmpty;
    } else if (subCategory == 'Faculty GRC') {
      QuerySnapshot query = await FirebaseFirestore.instance
          .collection('votes')
          .where('voterEmail', isEqualTo: userId)
          // .where('Category', isEqualTo: category)
          .where('SubCategory', isEqualTo: 'Faculty GRC')
          .get();

      return query.docs.isNotEmpty;
    }
    log("message: $category");
    return false;
  }
}
