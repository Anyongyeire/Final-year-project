import 'package:flutter/material.dart';
import 'package:login_app/src/common_widgets/form/form_header_widget.dart';
import 'package:login_app/src/constants/exporter.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/features/core/screens/admin/add_candidate/add_candidate_form_Widget.dart';

class AddCandidateScreen extends StatelessWidget {
  const AddCandidateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: FormHeaderWidget(
                    image: tWelcomeScreenImage1,
                    title: tAddCandidate,
                    subTitle: tAddCandidateSubTitle,
                  ),
                ),
                AddCandidateFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
