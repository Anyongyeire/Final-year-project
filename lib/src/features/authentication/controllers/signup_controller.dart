import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final fullName = TextEditingController();
  final email = TextEditingController();
  final stdNo = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

// Call this function from design & it will do the rest
  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserwithEmailAndPassword(email, password);
  }

// Get phonenumber from user and pass it to Auth repository for firbase authentication
  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
