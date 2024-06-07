import 'package:flutter/material.dart';
import 'package:login_app/src/constants/sizes.dart';

import 'faculty_category_item.dart';

class FacultyList extends StatelessWidget {
  const FacultyList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              FacultyCategoryItem("001",
                  "School of Computing and Information Sciences", Colors.red),
              SizedBox(
                height: tDefaultSize,
              ),
              FacultyCategoryItem("002",
                  "School of Management & Entrepreneureship", Colors.green),
              SizedBox(
                height: tDefaultSize,
              ),
              FacultyCategoryItem("003", "Faculty of Science", Colors.blue),
              // Add more faculties as needed
            ],
          ),
        ),
      ),
    );
  }
}
