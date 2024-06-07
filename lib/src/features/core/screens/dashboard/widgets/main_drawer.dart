import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/features/core/screens/dashboard/widgets/about_app.dart';
import 'package:login_app/src/features/core/screens/dashboard/widgets/dashboard.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/exporter.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildListTile(
      String title, IconData icon, void Function()? tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Raleway',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: isDarkMode ? tWhiteColor : tPrimaryColor,
            child: Text(
              tAppName,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(
            'Candidates',
            LineAwesomeIcons.user_friends,
            () {
              Get.offAll(() => const Dashboard());
            },
          ),
          buildListTile(
            'Votes',
            LineAwesomeIcons.vote_yea,
            () {
              Get.offAll(() => const Dashboard());
            },
          ),
          buildListTile(
            'About',
            LineAwesomeIcons.info,
            () {
              Get.to(() => const AboutApp());
            },
          ),
        ],
      ),
    );
  }
}
