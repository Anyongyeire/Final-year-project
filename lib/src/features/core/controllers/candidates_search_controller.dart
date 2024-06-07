import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../screens/admin/edit_candidte/user_edit_page.dart';

class CandidateSearchController {
  final TextEditingController searchController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> searchUser(BuildContext context) async {
    String name = searchController.text.trim();
    if (name.isNotEmpty) {
      QuerySnapshot querySnapshot = await _firestore
          .collection('candidates')
          .where('FullNames', isEqualTo: name)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        log("message: has data");
        // User found
        var candidate = querySnapshot.docs.first.data() as Map<String, dynamic>;
        // ignore: use_build_context_synchronously
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return AlertDialog(
        //       title: const Text('Candidate\'s Details'),
        //       content: Text(
        //           'Name: ${candidate['FullNames']}\nCategory: ${candidate['Category']}\nSubcategory: ${candidate['SubCategory']}\nPosition: ${candidate['NameOfPosition']}'),
        //       actions: <Widget>[
        //         TextButton(
        //           onPressed: () {
        //             Navigator.of(context).pop();
        //           },
        //           child: const Text('Close'),
        //         ),
        //       ],
        //     );
        //   },
        // );
        log("message: ${candidate['id']}");
        log("message: ${candidate['FullNames']}");
        log("message: ${candidate['Category']}");
        log("message: ${candidate['SubCategory']}");
        log("message: ${candidate['NameOfPosition']}");

        // User found, navigate to edit page
        // var user = querySnapshot.docs.first.data();
        if (candidate['FullNames'] != null &&
            candidate['NameOfPosition'] != null) {
          log("message: wehave data");
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserEditPage(userData: candidate),
            ),
          );
        }
      } else {
        // User not found
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('User Not Found'),
              content: Text('The user with the name "$name" was not found.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      }
    }
  }
}
