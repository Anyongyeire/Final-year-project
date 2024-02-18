import 'package:flutter/material.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/constants/exporter.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_repository.dart';

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
          leading: Icon(
            Icons.menu,
            color: isDarkMode ? tPrimaryColor : tSecondaryColor,
          ),
          backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
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
                  AuthenticationRepository.instance.logout();
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(tDefaultSize),
          ),
        ),
      ),
    );
  }
}
