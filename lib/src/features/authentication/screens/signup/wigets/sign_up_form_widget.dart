import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/exporter.dart';
import '../../../../../constants/sizes.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
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
              decoration: const InputDecoration(
                label: Text(tStdEmail),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: tPrimaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
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
            ),
            const SizedBox(
              height: tFormHeight - 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
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
