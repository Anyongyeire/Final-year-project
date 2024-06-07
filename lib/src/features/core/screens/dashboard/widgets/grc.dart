import 'package:flutter/material.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/constants/exporter.dart';
import 'package:login_app/src/constants/sizes.dart';

import '../../categories/grcs/grc_category_item.dart';

class GRC extends StatelessWidget {
  const GRC({super.key, required String category});

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
        ),
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
                  "GRC Categories",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: tDefaultSize - 10,
                ),
                GRCCategoryItem("001", "Faculties",
                    isDarkMode ? tSecondaryColor : tWhiteColor),
                const SizedBox(
                  height: tDefaultSize,
                ),
                // GRCCategoryItem("001", "Special Interest Groups",
                //     isDarkMode ? tSecondaryColor : tWhiteColor),
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
