import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/core/screens/dashboard/widgets/dashboard.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_repository.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/exporter.dart';
import '../../../../constants/sizes.dart';
import '../../controllers/login_controller.dart';
import '../forgot_password/forgot_password_options/forgot_password_model_bottom_sheet.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isObscured = true;
  final controller = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@std\.kyu\.ac\.ug$');

  @override
  Widget build(
    BuildContext context,
  ) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const EmailField(),
            TextFormField(
              // FilteringTextInputFormatter.allow(
              //     RegExp(r'^[a-zA-Z0-9._%+-]+@std\.kyu\.ac\.ug$'),
              //   ),

              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_outline_outlined),
                prefixIconColor: tPrimaryColor,
                labelText: tStudentsEmail,
                hintText: tEmail,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                iconColor: tPrimaryColor,
                hintStyle: const TextStyle(color: tPrimaryColor),
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
              height: tFormHeight - 10.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.fingerprint_outlined),
                prefixIconColor: tPrimaryColor,
                labelText: tPassword,
                hintText: tPassword,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                iconColor: tPrimaryColor,
                hintStyle: const TextStyle(color: tPrimaryColor),
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
            ),
            const SizedBox(
              height: tFormHeight - 20.0,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgotPasswordScreen.buildshowModalBottomSheet(context);
                },
                child: const Text(
                  tForgotPassword,
                  style: TextStyle(
                    color: tPrimaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, submit data
                    AuthenticationRepository.instance.sendEmailVerification();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Successfully Logged in!'),
                      ),
                    );
                    // Get.to(() => const Dashboard());
                  }
                  ;
                },
                child: Text(
                  tLogIn.toUpperCase(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
