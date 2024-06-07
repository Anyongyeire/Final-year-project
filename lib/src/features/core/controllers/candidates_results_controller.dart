import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/voting_repository/candidate_repository.dart';
import '../models/candidate_model.dart';

class CandidatesResultsController extends GetxController {
  static CandidatesResultsController get instance => Get.find();

  final nameUpdateController = TextEditingController();
  final categoryController = TextEditingController();
  final subCategoryController = TextEditingController();
  final positionController = TextEditingController();

  final candidateRepo = Get.put(CandidateRepository());

  updateCandidate() async {
    final candidate = CandidateModel(
      candidatename: nameUpdateController.text.trim(),
      category: categoryController.text.trim(),
      subcategory: subCategoryController.text.trim(),
      position: positionController.text.trim(),
    );
    await candidateRepo.getCandidateDetails(candidate.candidatename);
    log("name from repo: ${candidate.candidatename}");
  }
}
