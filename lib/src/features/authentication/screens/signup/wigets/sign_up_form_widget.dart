import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  bool isObscured = true;
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
              decoration: InputDecoration(
                label: const Text(tPassword),
                prefixIcon: const Icon(
                  Icons.fingerprint_sharp,
                  color: tPrimaryColor,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscured = !isObscured;
                    });
                  },
                  icon: Icon(
                    // isObscured ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                    isObscured ? Icons.visibility_off : Icons.visibility,
                    semanticLabel:
                        isObscured ? 'show password' : 'hide password',
                  ),
                ),
                suffixIconColor: tPrimaryColor,
              ),
              obscureText: isObscured,
              controller: controller.password,
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
              obscureText: isObscured,
              controller: controller.confirmPassword,
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

                    /// Get user and pass it to controller
                    // final user = UserModel(
                    //   fullname: controller.fullName.text.trim(),
                    //   email: controller.email.text.trim(),
                    //   phoneNo: controller.phoneNo.text.trim(),
                    //   // stdNo: controller.stdNo.text.trim(),
                    //   password: controller.password.text.trim(),
                    // );
                    SignUpController.instance
                        .createUser(); // email auth user register

                    // Email Authentication
                    // SignUpController.instance.registerUser(
                    //     controller.email.text.trim(),
                    //     controller.password.text.trim());

                    /// Phone authentication
                    // SignUpController.instance
                    //     .phoneAuthentication(controller.phoneNo.text.trim());
                    // Get.to(
                    //   () => const OtpScreen(),);

                    // SignUpController.instance
                    //     .createUser(user); // phonenumber auth
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
