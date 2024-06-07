import 'package:flutter/material.dart';
import 'package:login_app/src/constants/sizes.dart';

import '../two_main_categories/candidate_category_item.dart';

class SIGCategoriesList extends StatelessWidget {
  const SIGCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SIG's"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoryItem("001", "Private Students", Colors.red),
              SizedBox(
                height: tDefaultSize,
              ),
              CategoryItem("002", "Government Students", Colors.green),
              SizedBox(
                height: tDefaultSize,
              ),
              CategoryItem("003", "Evening Students", Colors.blue),
              // Add more faculties as needed
            ],
          ),
        ),
      ),
    );
  }
}
