import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controllers/add_candidate_controller.dart';

class AddCandidateFormWidget extends StatefulWidget {
  const AddCandidateFormWidget({super.key});

  @override
  State<AddCandidateFormWidget> createState() => _AddCandidateFormWidgetState();
}

class _AddCandidateFormWidgetState extends State<AddCandidateFormWidget> {
  String? selectedCategory;
  String? selectedSubCategory;
  String? selectedPosition;
  List<String> grcList = [];
  List<String> sigList = [];

  // ...

  @override
  void initState() {
    super.initState();
    fetchGrcListFromFirebase();
    fetchGisListFromFirebase();
  }

  void fetchGrcListFromFirebase() {
    FirebaseFirestore.instance
        .collection('faculties')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        grcList.add(doc['Faculty']);
      }
    });
  }

  void fetchGisListFromFirebase() {
    FirebaseFirestore.instance
        .collection('sig')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        sigList.add(doc['Group']);
      }
    });
  }

  // ...

  //   FirebaseFirestore.instance
  //       .collection('faculties')
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     for (var doc in querySnapshot.docs) {
  //       grcList.add(doc['Faculty']);
  //     }
  //   });
  // }

  List<String> noneList = ['Guild President'];

  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(AddCandidateController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.candidateName,
              decoration: const InputDecoration(
                label: Text(tCandidateName),
                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                  color: tPrimaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                label: Text(tCandidateCategory),
                prefixIcon: Icon(
                  Icons.supervised_user_circle_outlined,
                  color: tPrimaryColor,
                ),
              ),
              value: selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue;
                  log(selectedCategory!);
                  if (newValue == 'Guild President') {
                    selectedSubCategory = 'None';
                    selectedPosition = 'Guild President';
                    log(selectedSubCategory!);
                    log(selectedPosition!);
                  }
                  // Add more conditions here if needed
                });
              },
              items: <String>[
                'Guild President',
                'GRC',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                label: Text(tCandidateSubCategory),
                prefixIcon: Icon(
                  Icons.format_list_numbered,
                  color: tPrimaryColor,
                ),
              ),
              value: selectedSubCategory,
              onChanged: (newValue) {
                setState(() {
                  selectedSubCategory = newValue;
                  log(selectedSubCategory!);
                });
              },
              items: <String>[
                'Faculty GRC',
                'Special Interest Group GRC',
                'None',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                label: Text(tCandidatePosition),
                prefixIcon: Icon(
                  Icons.airline_seat_recline_normal_rounded,
                  color: tPrimaryColor,
                ),
              ),
              value: selectedPosition,
              onChanged: (newValue) {
                setState(() {
                  selectedPosition = newValue;
                  log(selectedPosition!);
                });
              },
              items: (selectedSubCategory == 'Faculty GRC'
                      ? grcList
                      : selectedSubCategory == 'Special Interest Group GRC'
                          ? sigList
                          : noneList)
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              height: tFormHeight - 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  AddCandidateController.instance.addCandidate(
                      selectedCategory, selectedSubCategory, selectedPosition);
                  _formKey.currentState?.reset();
                },
                child: const Text(
                  tAddCandidate,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
