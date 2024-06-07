import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/exporter.dart';
import '../../../../../constants/sizes.dart';
import '../forgot_password_mail/forgot_password_mail.dart';
import '../forgot_password_phone/forgot_password_phone.dart';
import 'forgot_password_btn_widget.dart';

class ForgotPasswordScreen {
  static Future<dynamic> buildshowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tForgetPasswordTitle,
                style: Theme.of(context).textTheme.displaySmall),
            Text(tForgetPasswordSubTitle,
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(
              height: tDefaultSize,
            ),
            ForgotPasswordBtnWidget(
              btnIcon: Icons.mail_outline_rounded,
              title: tEmail,
              subTitle: tResetViaEmail,
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgotPasswordMailScreen());
              },
            ),
            const SizedBox(
              height: tDefaultSize,
            ),
            ForgotPasswordBtnWidget(
              btnIcon: Icons.mobile_friendly_rounded,
              title: tPhoneNo,
              subTitle: tResetViaPhone,
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgotPasswordPhoneScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
