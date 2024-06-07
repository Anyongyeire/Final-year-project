import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class CandidateData {
  final String name;
  final String category;
  final String subCategory;
  final int votes;

  CandidateData(this.name, this.votes, this.category, this.subCategory);
}

Future<List<CandidateData>> getCandidateData() async {
  List<CandidateData> candidates = [];

  await FirebaseFirestore.instance
      .collection('candidates')
      .where('Category', isEqualTo: 'Guild President')
      .get()
      .then((QuerySnapshot querySnapshot) async {
    for (var doc in querySnapshot.docs) {
      String name = doc['FullNames'];
      String category = doc['Category'];
      String subCategory = doc['SubCategory'];
      Future<int> votes = FirebaseFirestore.instance
          .collection('votes')
          .where('CandidateName', isEqualTo: name)
          .where('Category', isEqualTo: 'Guild Presidents')
          .get()
          .then((QuerySnapshot querySnapshot) => querySnapshot.size);
      // int votes = candidates.length;
      candidates.add(CandidateData(name, await votes, category, subCategory));
    }
  });
  log(candidates.toString());
  return candidates;
}
