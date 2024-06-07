import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_repository.dart';

import '../../../../constants/exporter.dart';
import '../../controllers/mail_verification_controller.dart';

class MailVerification extends StatelessWidget {
  const MailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MailVerificationController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: tDefaultSize * 5,
              left: tDefaultSize,
              right: tDefaultSize,
              bottom: tDefaultSize * 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                LineAwesomeIcons.envelope_open,
                size: 100,
              ),
              const SizedBox(
                height: tDefaultSize * 2,
              ),
              Text(
                tEmailVerificationTitle.tr,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: tDefaultSize,
              ),
              Text(
                tEmailVerificationSubTitle.tr,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: tDefaultSize * 2,
              ),
              SizedBox(
                width: 200,
                child: OutlinedButton(
                  child: Text(
                    tContinue.tr,
                  ),
                  onPressed: () => controller.manuallyCheckVerificationStatus(),
                ),
              ),
              const SizedBox(
                height: tDefaultSize * 2,
              ),
              TextButton(
                onPressed: () => controller.sendVerificationEmail(),
                child: Text(
                  tResendEmailLink.tr,
                ),
              ),
              TextButton(
                onPressed: () => AuthenticationRepository.instance.logout(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      LineAwesomeIcons.alternate_long_arrow_left,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(tBackToLogin.tr.toLowerCase()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
