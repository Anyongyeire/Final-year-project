import 'package:cloud_firestore/cloud_firestore.dart';

class CandidateModel {
  final String? id;
  final String candidatename;
  final String category;
  final String subcategory;
  final String position;

  const CandidateModel({
    this.id,
    required this.candidatename,
    required this.category,
    required this.subcategory,
    required this.position,
  });

  toJason() {
    return {
      "Category": category,
      "FullNames": candidatename,
      "NameOfPosition": position,
      "SubCategory": subcategory,
    };
  }

  /// Mapp user fetched from the Firebase to usermodel
  factory CandidateModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return CandidateModel(
      id: document.id,
      category: data["Category"],
      candidatename: data["FullNames"],
      position: data["NameOfPosition"],
      subcategory: data["SubCategory"],
      // stdNo: data["StdNo"],
    );
  }
}
