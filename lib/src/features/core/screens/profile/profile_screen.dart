// ignore_for_file: deprecated_member_use, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/constants/exporter.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/features/authentication/models/user_model.dart';
import 'package:login_app/src/features/core/screens/profile/update_profile_screen.dart';

import '../../../../constants/colors.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../../controllers/profile_controller.dart';
import 'widgets/profile_menu.dart';
import 'widgets/user_management.dart';

class ProflieScreen extends StatelessWidget {
  const ProflieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            LineAwesomeIcons.angle_left,
          ),
        ),
        title: Center(
          child: Text(
            tProfile,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(150.0),
                      child: const Image(
                        image: AssetImage(tProfileImage),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: isDark
                            ? tPrimaryColor
                            : Colors.grey.withOpacity(0.1),
                      ),
                      child: const Icon(LineAwesomeIcons.alternate_pencil,
                          color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                tProfileHeading,
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                tProfileSubHeading,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              // FutureBuilder<String?>(
              //   future: controller.getUserData(),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.done) {
              //       if (snapshot.hasData && snapshot.data != null) {
              //         UserModel userData = snapshot.data as UserModel;
              //         return Text(
              //           // tProfileSubHeading,
              //           userData.email ?? 'N/A',
              //           style: Theme.of(context).textTheme.bodyText2,
              //         );
              //       } else {
              //        return Text (tProfileSubHeading,
              //           style: Theme.of(context).textTheme.bodyText2,);
              //       }
              //     }
              //   },
              // ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: 200.0,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const UpdateProfileScreen());
                  },
                  child: const Text(
                    tEditProfile,
                    style: TextStyle(color: tBlackColor),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tPrimaryColor,
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Divider(),
              const SizedBox(
                height: 10.0,
              ),

              //Menu

              ProfileMenuWidget(
                isDark: isDark,
                title: tMenu1,
                icon: LineAwesomeIcons.cog,
                onpress: () {},
              ),
              ProfileMenuWidget(
                isDark: isDark,
                title: tMenu2,
                icon: LineAwesomeIcons.wallet,
                onpress: () {},
              ),
              ProfileMenuWidget(
                isDark: isDark,
                title: tMenu3,
                icon: LineAwesomeIcons.user_check,
                onpress: () {},
              ),
              const Divider(),
              ProfileMenuWidget(
                isDark: isDark,
                title: tMenu4,
                icon: LineAwesomeIcons.info,
                onpress: () {
                  Get.to(() => const UserManagement());
                },
              ),
              ProfileMenuWidget(
                isDark: isDark,
                title: tMenu5,
                icon: LineAwesomeIcons.alternate_sign_out,
                onpress: () {
                  AuthenticationRepository.instance.logout();
                },
                textColor: Colors.red,
                endIcon: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
