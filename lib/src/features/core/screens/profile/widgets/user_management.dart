// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../constants/sizes.dart';
import '../../../../authentication/models/user_model.dart';
import '../../../controllers/profile_controller.dart';

class UserManagement extends StatelessWidget {
  const UserManagement({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: FutureBuilder<List<UserModel>>(
            future: controller.getAllUser(),
            builder: (context, snapshot) {
              log("11111111");
              log(controller.getAllUser().toString());
              if (snapshot.connectionState == ConnectionState.done) {
                log("Conneced!");
                if (snapshot.hasData) {
                  log("has data");
                  // UserModel userData = snapshot.data as UserModel;
                  // log(userData as String);
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (c, index) {
                      return Column(
                        children: [
                          ListTile(
                            iconColor: Colors.blue,
                            tileColor: Colors.blue.withOpacity(0.1),
                            leading: const Icon(LineAwesomeIcons.user_1),
                            title:
                                Text("Name: ${snapshot.data?[index].fullname}"),
                            // title: Text(
                            //     "Name: ${snapshot.data![index].toString()}"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data![index].email),
                                Text(snapshot.data![index].phoneNo),
                                // Text(snapshot.data![index].phoneNo),
                              ],
                            ),
                          )
                        ],
                      );
                    },
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
