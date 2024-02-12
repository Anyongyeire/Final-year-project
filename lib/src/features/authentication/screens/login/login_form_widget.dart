import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/exporter.dart';
import '../../../../constants/sizes.dart';
import '../forgot_password/forgot_password_options/forgot_password_model_bottom_sheet.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Form(
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
                labelText: tEmail,
                hintText: tStudentsEmail,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                iconColor: tPrimaryColor,
                hintStyle: const TextStyle(color: tPrimaryColor),
              ),
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
                suffixIcon: const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.remove_red_eye_sharp,
                  ),
                ),
                suffixIconColor: tPrimaryColor,
              ),
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
                onPressed: () {},
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
