import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/authentication/models/user_model.dart';
import 'package:login_app/src/features/authentication/screens/forgot_password/forgot_password_otp/otp_screen.dart';
import 'package:login_app/src/features/authentication/screens/login/login_screen.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/exporter.dart';
import '../../../../../constants/sizes.dart';
import '../../../controllers/signup_controller.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(SignUpController());
  final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@std\.kyu\.ac\.ug$');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(
                label: Text(tFullName),
                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                  color: tPrimaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                label: Text(tStdEmail),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: tPrimaryColor,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!emailRegex.hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              controller: controller.stdNo,
              decoration: const InputDecoration(
                label: Text(tStdNo),
                prefixIcon: Icon(
                  Icons.format_list_numbered,
                  color: tPrimaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              controller: controller.phoneNo,
              decoration: const InputDecoration(
                label: Text(tPhoneNo),
                prefixIcon: Icon(
                  Icons.numbers,
                  color: tPrimaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(tPassword),
                prefixIcon: Icon(
                  Icons.fingerprint_sharp,
                  color: tPrimaryColor,
                ),
              ),
              controller: controller.password,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(tConfirmPassword),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: tPrimaryColor,
                ),
              ),
              controller: controller.confirmPassword,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != controller.password.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            const SizedBox(
              height: tFormHeight - 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, submit data
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Successfully Added!'),
                      ),
                    );

                    /// Email Authentication
                    // SignUpController.instance.registerUser(
                    //     controller.email.text.trim(),
                    //     controller.password.text.trim());

                    /// Phone authentication
                    // SignUpController.instance
                    //     .phoneAuthentication(controller.phoneNo.text.trim());
                    // Get.to(
                    //   () => const OtpScreen(),);

                    /// Get user and pass it to controller
                    final user = UserModel(
                      fullname: controller.fullName.text.trim(),
                      email: controller.email.text.trim(),
                      phoneNo: controller.phoneNo.text.trim(),
                      stdNo: controller.stdNo.text.trim(),
                      password: controller.password.text.trim(),
                    );
                    SignUpController.instance.createUser(user);
                  }
                },
                child: Text(
                  tSignUp.toUpperCase(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
