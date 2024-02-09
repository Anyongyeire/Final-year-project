import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../constants/colors.dart';
import '../../../constants/exporter.dart';
import '../../../constants/image_strings.dart';
import '../models/model_on_bording.dart';
import '../screens/on_bording/on_bording_page_widget.dart';

class OnBordingController extends GetxController {
  final controller = LiquidController();

  Rx currentPage = 0.obs;

  final pages = [
    OnBordingPageWidget(
      model: OnBordingModel(
        image: tOnBordingImage1,
        title: tOnBordingTitle1,
        subTitle: tOnBordingSubTitle1,
        counterText: tOnBordingCounter1,
        bgcolor: tOnBordingPage1Color,
      ),
    ),
    OnBordingPageWidget(
      model: OnBordingModel(
        image: tOnBordingImage2,
        title: tOnBordingTitle2,
        subTitle: tOnBordingSubTitle2,
        counterText: tOnBordingCounter2,
        bgcolor: tOnBordingPage2Color,
      ),
    ),
    OnBordingPageWidget(
      model: OnBordingModel(
        image: tOnBordingImage3,
        title: tOnBordingTitle3,
        subTitle: tOnBordingSubTitle3,
        counterText: tOnBordingCounter3,
        bgcolor: tOnBordingPage3Color,
      ),
    ),
  ];

  void OnPageChangeCallback(int activePageIndex) =>
      currentPage.value = activePageIndex;
  skip() {
    // controller.jumpToPage(page: 2);

    // Navigator.pushNamed(
    //     context, '/welsome-screen-page'
    // MaterialPageRoute(
    //   builder: (context) => const WelcomeScreen(),
    // ),
    // );
  }

  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
}
