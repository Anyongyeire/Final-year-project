import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class CandidateGRC {
  final String nameGRC;
  final String category;
  final String subCategory;
  final int votesGRC;

  CandidateGRC(this.nameGRC, this.votesGRC, this.category, this.subCategory);
}

Future<List<CandidateGRC>> getGRC(String category) async {
  List<CandidateGRC> candidates = [];
  log("message in grc data: $category");
  var schoolName = category.toString().trim();
  await FirebaseFirestore.instance
      .collection('candidates')
      .where('NameOfPosition', isEqualTo: schoolName)
      .get()
      .then((QuerySnapshot querySnapshot) async {
    for (var doc in querySnapshot.docs) {
      String name = doc['FullNames'];
      String category = doc['Category'];
      log(schoolName);
      String subCategory = doc['SubCategory'];
      Future<int> votes = FirebaseFirestore.instance
          .collection('votes')
          .where('CandidateName', isEqualTo: name)
          // .where('Category', isEqualTo: schoolName)
          // .where('SubCategory', isEqualTo: 'Faculty GRC')
          .get()
          .then((QuerySnapshot querySnapshot) => querySnapshot.size);
      // int votes = candidates.length;
      candidates.add(CandidateGRC(name, await votes, category, subCategory));
      // int votes = candidates.length;
      // candidates.add(CandidateGRC(name, votes));
      // log(name);
    }
  });
  // log("message: ${query}");
  // log(category);
  // log(candidates.toString());
  return candidates;
}
