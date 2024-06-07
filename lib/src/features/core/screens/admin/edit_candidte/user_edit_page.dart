import 'package:flutter/material.dart';

import '../../../controllers/edit_candidate_controller.dart';

class UserEditPage extends StatelessWidget {
  final Map<String, dynamic> userData;
  final UserEditController _controller = UserEditController();

  UserEditPage({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    _controller.nameController.text = userData['FullNames'];
    _controller.categoryController.text = userData['Category'];
    _controller.subCategoryController.text = userData['SubCategory'];
    _controller.positionController.text = userData['NameOfPosition'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Candidate'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                // TextEditingController(text: user.password),
                controller: _controller.nameController,
                decoration: const InputDecoration(
                  labelText: 'Name of Candidate',
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _controller.categoryController,
                decoration: const InputDecoration(
                  labelText: 'Category',
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                // TextEditingController(text: user.password),
                controller: _controller.subCategoryController,
                decoration: const InputDecoration(
                  labelText: 'Sub Category',
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _controller.positionController,
                decoration: const InputDecoration(
                  labelText: 'Position',
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _controller.updateUser(userData['FullNames']);
                    // log("id: ${userData['FullNames']}");
                    Navigator.pop(context); // Go back to search page
                  },
                  child: const Text('Update'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
