// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/exporter.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../authentication/models/user_model.dart';
import '../../../controllers/profile_controller.dart';
import '../update_profile_screen.dart';

class UserInformationScreen extends StatelessWidget {
  const UserInformationScreen({super.key});

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
            tBio,
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
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                UserModel? userData = snapshot.data as UserModel?;
                log("in connection");
                log(snapshot.data.toString());
                if (snapshot.hasData) {
                  // UserModel userData = UserModel.fromSnapshot(snapshot.data);
                  return Column(
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
                          // Positioned(
                          //   bottom: 0,
                          //   right: 0,
                          //   child: Container(
                          //     width: 35,
                          //     height: 35,
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(100),
                          //       color: isDark
                          //           ? tPrimaryColor
                          //           : Colors.grey.withOpacity(0.1),
                          //     ),
                          //     // child: const Icon(LineAwesomeIcons.camera,
                          //     //     color: Colors.black, size: 20),
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Form(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.person_outline_outlined,
                                  color: tPrimaryColor,
                                ),
                                Text(
                                  "Names: ${userData!.fullname}",
                                  // initialValue: ,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: tFormHeight - 10,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.mail_outline_rounded,
                                  color: tPrimaryColor,
                                ),
                                Text(
                                  "Email: ${userData.email}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    // color: tPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: tFormHeight - 10,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  LineAwesomeIcons.phone_square,
                                  color: tPrimaryColor,
                                ),
                                Text(
                                  "Telephone: ${userData.phoneNo}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: tFormHeight - 10,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(
                                    () => const UpdateProfileScreen(),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: tPrimaryColor,
                                  side: BorderSide.none,
                                  shape: const StadiumBorder(),
                                ),
                                child: Text(
                                  tEdit.toUpperCase(),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: tFormHeight,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: tJoined,
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: tJoinedAt,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ))
                                    ],
                                  ),
                                ),
                                // ElevatedButton(
                                //   onPressed: () {},
                                //   style: ElevatedButton.styleFrom(
                                //     backgroundColor: Colors.redAccent.withOpacity(0.1),
                                //     elevation: 0,
                                //     foregroundColor: Colors.red,
                                //     shape: const StadiumBorder(),
                                //     side: BorderSide.none,
                                //   ),
                                //   child: const Text(tDelete),
                                // ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(
                      "Something went wrong!",
                    ),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
