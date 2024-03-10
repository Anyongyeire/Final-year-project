import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_repository.dart';

import '../../../repository/user_repository/user_repository.dart';
import '../models/user_model.dart';
import '../screens/forgot_password/forgot_password_otp/otp_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final fullName = TextEditingController();
  final email = TextEditingController();
  final stdNo = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  final userRepo = Get.put(UserRepository());

// Loader
  final isLoading = false.obs;

  // As in the AuthenticationRepository we are calling _setScreen() method
  //so whenever there is a change in the user state(), screen will be updated.
  //Therefore, when new user is authenticated, AuthenticationRepository() detects
  // the change and call _setScreen() to switch screens

  ///Register New USer using either [EmailAndPassword] OR [PhoneNumber] authentication
  // Future<void> createUser() async {
  //   try {
  //     isLoading.value = true;
  //     // if (!signupFormKey.currentState!.validate()) {
  //     //   isLoading.value = false;
  //     //   return;
  //     // }

  //     /// For Phone Authentication
  //     // SignUpController.instance
  //     //     .phoneAuthentication(controller.phoneNo.text.trim());
  //     // Get.to(() => const OtpScreen());

  //     // Get User and Pass it to Controller
  //     // final user = UserModel(
  //     //   fullname: fullName.text.trim(),
  //     //   email: email.text.trim(),
  //     //   phoneNo: phoneNo.text.trim(),
  //     //   password: password.text.trim(),
  //     // );

  //     // // Authentication User first

  //     // final auth = AuthenticationRepository.instance;
  //     // await auth.createUserwithEmailAndPassword(user.email, user.password);
  //     // await UserRepository.instance.createUser(user);
  //     // auth.setInitialScreen(auth.currentUser);
  //   } catch (e) {
  //     isLoading.value = false;
  //     Get.showSnackbar(GetSnackBar(
  //       title: "Error",
  //       message: e.toString(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: const Duration(seconds: 3),
  //     ));
  //   }
  // }

// Call this function from design & it will do the rest
  // void registerUser(String email, String password) {
  //   AuthenticationRepository.instance
  //       .createUserwithEmailAndPassword(email, password);
  // }
  void registerUser(String email, String password) {
    String? error = AuthenticationRepository.instance
        .createUserwithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }

// Get phonenumber from user and pass it to Auth repository for firbase authentication
  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    phoneAuthentication(user.phoneNo);
    Get.to(() => const OtpScreen());
  }

  /// [PhoneAuthentication]
  void phoneAuthentication(String phoneNo) {
    try {
      AuthenticationRepository.instance.phoneAuthentication(phoneNo);
    } catch (e) {
      throw e.toString();
    }
  }
}
