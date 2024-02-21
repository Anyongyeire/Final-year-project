import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/constants/sizes.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/exporter.dart';
import '../../../../constants/image_strings.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            tEditProfile,
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
                      child: const Icon(LineAwesomeIcons.camera,
                          color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(tPhoneNo),
                        prefixIcon: Icon(
                          Icons.numbers,
                          color: tPrimaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: tFormHeight - 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text(tPassword),
                        prefixIcon: Icon(
                          Icons.fingerprint_sharp,
                          color: tPrimaryColor,
                        ),
                      ),
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
                          tSave.toUpperCase(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: tFormHeight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
