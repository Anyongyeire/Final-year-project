import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:login_app/src/constants/sizes.dart';

import '../two_main_categories/candidate_category_item.dart';

class GRCCategoriesList extends StatelessWidget {
  const GRCCategoriesList({super.key, required String category});

  @override
  Widget build(BuildContext context) {
    log("message");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Faculties"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoryItem("001",
                  "School of Computing and Information Sciences", Colors.red),
              SizedBox(
                height: tDefaultSize,
              ),
              CategoryItem("002", "School of Management & Entrepreneureship",
                  Colors.green),
              SizedBox(
                height: tDefaultSize,
              ),
              CategoryItem("003", "Faculty of Science", Colors.blue),
              // Add more faculties as needed
            ],
          ),
        ),
      ),
    );
  }
}
