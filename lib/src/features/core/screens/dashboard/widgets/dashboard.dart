import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/constants/exporter.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/features/core/screens/profile/profile_screen.dart';

import '../../categories/two_main_categories/candidate_category_item.dart';
import 'main_drawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
        drawer: const MainDrawer(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ElevatedButton(
                //   onPressed: () {
                //     // Navigate to Guild Presidents Page
                //   },
                //   child: const Text('Guild Presidents'),
                // ),

                const Text(
                  "Candidate Categories",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: tDefaultSize - 10,
                ),
                CategoryItem("001", "Guild Presidents",
                    isDarkMode ? tSecondaryColor : tWhiteColor),
                const SizedBox(
                  height: tDefaultSize,
                ),
                CategoryItem("001", "Guild Representative Councilors",
                    isDarkMode ? tSecondaryColor : tWhiteColor),
                // const SizedBox(
                //   height: tDefaultSize,
                // ),
                // CategoryItem("001", " Specicial Interest groups",
                //     isDarkMode ? tSecondaryColor : tWhiteColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
