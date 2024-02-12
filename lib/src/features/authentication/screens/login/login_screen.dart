import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/colors.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../signup/signup_screen.dart';
import 'login_form_widget.dart';
import '../../../../common_widgets/form/form_header_widget.dart';
import '../../../../constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var mediaQuery = MediaQuery.of(context);
    // var size = mediaQuery.size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize + 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormHeaderWidget(
                  image: tWelcomeScreenImage1,
                  title: tLogninTitle,
                  subTitle: tLoginSubtitle,
                ),
                // --form
                const LoginForm(),
                const SizedBox(
                  height: tFormHeight - 20,
                ),
                TextButton(
                  onPressed: () => Get.to(
                    () => const SignUpScreen(),
                  ),
                  child: Text.rich(TextSpan(
                    text: tDontHaveAnAccount,
                    style: Theme.of(context).textTheme.bodyText1,
                    children: const [
                      TextSpan(
                        text: tSignUp,
                        style: TextStyle(
                          color: tPrimaryColor,
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
