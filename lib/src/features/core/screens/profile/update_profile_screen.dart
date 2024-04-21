// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/exporter.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../authentication/models/user_model.dart';
import '../../controllers/profile_controller.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

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
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                UserModel user = snapshot.data as UserModel;

                if (snapshot.hasData) {
                  // UserModel userData = UserModel.fromSnapshot(snapshot.data);
                  if (user.email == '2000809567@std.kyu.ac.ug') {
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
                                controller:
                                    TextEditingController(text: user.phoneNo),
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
                                controller:
                                    TextEditingController(text: user.password),
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
                                  onPressed: () async {
                                    // final userData = UserModel(
                                    //   fullname: fullName.text.trim(),
                                    //   email: email.text.trim(),
                                    //   phoneNo: phoneNo.text.trim(),
                                    //   password: password.text.trim(),
                                    // );
                                    // log("message: here");
                                    // log(user.toString());
                                    await controller.UpdateRecord(user);
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
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
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
                                  image: AssetImage(tDefaultProfileImage),
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
                                controller:
                                    TextEditingController(text: user.phoneNo),
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
                                controller:
                                    TextEditingController(text: user.password),
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
                                  onPressed: () async {
                                    // final userData = UserModel(
                                    //   fullname: fullName.text.trim(),
                                    //   email: email.text.trim(),
                                    //   phoneNo: phoneNo.text.trim(),
                                    //   password: password.text.trim(),
                                    // );
                                    // log("message: here");
                                    // log(user.toString());
                                    await controller.UpdateRecord(user);
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
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  }
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
