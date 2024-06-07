import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:login_app/droidcon_exporter.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/constants/exporter.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/features/authentication/controllers/otp_controller.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    // var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    var otpcontroller = Get.put(OTPController());
    String otp;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tOtpTitle,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 80.0,
                color: isDarkMode ? tPrimaryColor : tSecondaryColor,
              ),
            ),
            Text(
              tOtpSubTitle.toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              tOtpMessage + tOtpMail,
              textAlign: TextAlign.center,
            ),
            // Text(
            //   tOtpMail,
            //   textAlign: TextAlign.center,
            //   style: TextStyle(fontStyle: FontStyle.italic),
            // ),
            const SizedBox(
              height: 40.0,
            ),
            OtpTextField(
              numberOfFields: 6,
              fillColor:
                  isDarkMode ? Colors.white.withOpacity(0.2) : tPrimaryColor,
              filled: true,
              onSubmit: (code) {
                otp = code;
                OTPController.instance.verifyOTP(otp);
                otpcontroller;
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // RxController:
                  String otp = '';
                  OTPController.instance.verifyOTP(otp);
                  otpcontroller;
                },
                child: const Text(
                  tNext,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
