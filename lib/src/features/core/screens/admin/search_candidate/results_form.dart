import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/candidates_results_controller.dart';

class CandidatesResultsFormWidget extends StatelessWidget {
  final controller = Get.put(CandidatesResultsController());
  final _formKey = GlobalKey<FormState>();
  CandidatesResultsFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        TextFormField(
          // controller: controller.nameUpdateController,
          // controller: TextEditingController(
          //     text: candidateData.candidatename),
          decoration: const InputDecoration(
            labelText: 'Candidates Name',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter candidates name';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          // controller: controller.categoryController,
          decoration: const InputDecoration(
            labelText: 'Category',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter category name';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          // controller: controller.subCategoryController,
          decoration: const InputDecoration(
            labelText: 'Sub-Category Name',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter sub-category name';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        TextFormField(
          // controller: controller.positionController,
          decoration: const InputDecoration(
            labelText: 'Candidates Position',
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter candidates\' position';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final data = {
                  'Category': controller.categoryController.text,
                  'FullNames': controller.nameUpdateController.text,
                  'NameOfPosition': controller.positionController.text,
                  'SubCategory': controller.subCategoryController.text,
                };
                print(data);
                // Use the data as needed
              }
            },
            child: const Text('Update'),
          ),
        ),
      ],
    );
  }
}
