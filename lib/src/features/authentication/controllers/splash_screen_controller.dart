import 'package:get/get.dart';
import '../../authentication/screens/on_bording/on_bording_screen.dart';
// import 'package:login_app/src/features/authentication/screens/welcome/welcome_screen.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));

    animate.value = true;

    await Future.delayed(const Duration(milliseconds: 5000));
    Get.to(() => OnBordingScreen());
    // Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (context) => const WelcomeScreen()));
  }
}
