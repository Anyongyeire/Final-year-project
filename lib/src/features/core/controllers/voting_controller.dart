// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/voting_repository/voting_repository.dart';

class VotingController extends GetxController {
  final VotingRepository _repository = VotingRepository();

  Future<void> submitVote(BuildContext context, String userId, String category,
      String candidateId, String name) async {
    bool hasVoted =
        await _repository.checkIfVoted(userId, category, candidateId);

    if (hasVoted) {
      // Handle alert or UI update for already voted scenario
      // User has already voted, display an alert
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Already Voted'),
          content: const Text('You have already voted in this category.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      bool confirmVote = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Confirm Vote'),
          content: Text('Are you sure you want to submit your vote for $name?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
          ],
        ),
      );

      if (confirmVote == true) {
        await _repository.submitVote(userId, category, candidateId, name);
        // Handle UI update after successful vote submission
      }
      // await _repository.submitVote(userId, category, candidateId, name);
      // Handle UI update after successful vote submission
    }
  }
}
