import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/constants/exporter.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/features/core/screens/profile/profile_screen.dart';

import 'main_drawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: isDarkMode ? tPrimaryColor : tSecondaryColor,
          ),
          backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
          // leading: IconButton(
          //   onPressed: Get.to(() => const MainDrawer()),
          //   icon: const Icon(Icons.menu),
          // ),
          title: Text(
            tAppName,
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: isDarkMode ? tPrimaryColor : tSecondaryColor,
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
                borderRadius: BorderRadius.circular(10.0),
                color: tCardBgColor,
              ),
              child: IconButton(
                onPressed: () {
                  // AuthenticationRepository.instance.logout();
                  Get.to(() => const ProflieScreen());
                },
                icon: const Image(
                  image: AssetImage(
                    tUserProfileImage,
                  ),
                ),
              ),
            ),
          ],
        ),
        drawer: const MainDrawer(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(tDefaultSize),
          ),
        ),
      ),
    );
  }
}
