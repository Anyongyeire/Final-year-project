import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CandidatesListController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getCandidatesStream() {
    return _firestore.collection('candidates').snapshots();
  }

  Future<void> deleteCandidate(
      BuildContext context, String candidateId, String candidateName) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content:
              Text('Are you sure you want to delete Candidate $candidateName?'),
          actions: [
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () async {
                await _firestore
                    .collection('candidates')
                    .doc(candidateId)
                    .delete();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
    // await _firestore.collection('candidates').doc(candidateId).delete();
  }
}
