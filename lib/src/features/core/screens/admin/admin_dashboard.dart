// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/constants/exporter.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/features/core/screens/profile/profile_screen.dart';

import '../../../../constants/image_strings.dart';
import '../dashboard/widgets/dashboard.dart';
import 'add_candidate/add_candidate_screen.dart';
import 'delete_candidate/candidates_list_page.dart';
import 'search_candidate/candidate_search_widget.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const ClipRRect(
            borderRadius: BorderRadius.all(circularRadius16),
            child: Image(
              image: AssetImage(tSplashLogo),
              width: 30,
              height: 30,
            ),
          ),
          iconTheme: IconThemeData(
            color: isDarkMode ? tPrimaryColor : tWhiteColor,
          ),
          backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
          title: Text(
            tAppName,
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: isDarkMode ? tPrimaryColor : tWhiteColor,
                ),
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            Container(
              margin: const EdgeInsets.only(
                right: 20,
                top: 7,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                color: isDarkMode ? tPrimaryColor : tWhiteColor,
              ),
              child: IconButton(
                onPressed: () {
                  Get.to(() => const ProflieScreen());
                },
                // icon: const Image(
                //   image: AssetImage(
                //     tUserProfileImage,
                //   ),
                // ),
                icon: Icon(
                  Icons.person,
                  color: isDarkMode ? tWhiteColor : tPrimaryColor,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.to(() => const AddCandidateScreen());
                    },
                    icon: const Icon(LineAwesomeIcons.plus),
                    label: const Text('Add Candidate'),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.to(() => CandidateSearchWidget());
                      // Update candidate logic here
                    },
                    icon: const Icon(LineAwesomeIcons.edit),
                    label: const Text('Update Candidate'),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.to(() => CandidateListPage());
                      // Delete candidate logic here
                    },
                    icon: const Icon(
                      LineAwesomeIcons.trash,
                      color: Colors.red,
                    ),
                    label: const Text(
                      'Delete Candidate',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.to(() => const Dashboard());
                      // Delete candidate logic here
                    },
                    icon: const Icon(
                      LineAwesomeIcons.cogs,
                      color: Color.fromARGB(255, 25, 28, 235),
                    ),
                    label: const Text(
                      'Voting Progress',
                      style: TextStyle(color: Color.fromARGB(255, 25, 28, 235)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
