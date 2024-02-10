import 'package:get/get.dart';
import '../../features/authentication/screens/on_bording/on_bording_screen.dart';
// import 'package:login_app/src/features/authentication/screens/welcome/welcome_screen.dart';

class TFadeInAnimationController extends GetxController {
  static TFadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future startSplashAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));

    animate.value = true;

    await Future.delayed(const Duration(milliseconds: 3000));
    animate.value = false;

    await Future.delayed(const Duration(milliseconds: 2000));

    // Get.to(() => OnBordingScreen());s
    Get.offAll(() => OnBordingScreen());
    // Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (context) => const WelcomeScreen()));
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));

    animate.value = true;
  }
}
