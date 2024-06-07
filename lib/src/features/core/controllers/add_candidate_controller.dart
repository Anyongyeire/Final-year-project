import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/core/models/candidate_model.dart';
import '../../../repository/voting_repository/candidate_repository.dart';

class AddCandidateController extends GetxController {
  static AddCandidateController get instance => Get.find();

  final candidateName = TextEditingController();
  RxString selectedCategory = ''.obs;
  RxString selectedSubCategory = ''.obs;
  RxString selectedPosition = ''.obs;
  GlobalKey<FormState> addCandidateFormKey = GlobalKey<FormState>();

  final candidateRepo = Get.put(CandidateRepository());

  ///Register New USer using either [EmailAndPassword] OR [PhoneNumber] authentication
  Future<void> addCandidate(
      selectedCategory, selectedSubCategory, selectedPosition) async {
    // Get User and Pass it to Controller
    final candidate = CandidateModel(
      candidatename: candidateName.text.trim(),
      category: selectedCategory.toString().trim(),
      subcategory: selectedSubCategory.toString().trim(),
      position: selectedPosition.toString().trim(),
    );
    await candidateRepo.addCandidate(candidate);
    // await auth.collection('candidates').add(candidate.toJson());

    // Authentication User first
  }

  searchCandidate(String name) async {
    // Implement your search logic here.
    // For example, you might fetch data from Firebase based on the provided name.
    // final candidates =
    log("results");
    return await candidateRepo.getCandidateDetails(name);
    // Do something with the candidates
  }
}
