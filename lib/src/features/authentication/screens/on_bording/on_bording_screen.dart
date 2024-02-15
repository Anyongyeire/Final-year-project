import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/features/authentication/controllers/on_bording_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingScreen extends StatelessWidget {
  OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obcontroller = OnBordingController();
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obcontroller.pages,
            liquidController: obcontroller.controller,
            onPageChangeCallback: obcontroller.OnPageChangeCallback,
            slideIconWidget: Icon(
              Icons.arrow_back_ios,
              color: isDarkMode ? tSecondaryColor : tPrimaryColor,
            ),
            enableSideReveal: true,
          ),
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () => obcontroller.animateToNextSlide(),
              style: ElevatedButton.styleFrom(
                side: BorderSide(
                    color: isDarkMode ? tSecondaryColor : tPrimaryColor),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20.0),
                onPrimary: Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: tPrimaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Positioned(
            top: 50.0,
            right: 20.0,
            child: TextButton(
              onPressed: () {
                obcontroller.skip();
                Navigator.pushNamed(context, '/welcome-screen-page');
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: tPrimaryColor),
              ),
            ),
          ),
          Obx(
            () => Positioned(
              bottom: 10.0,
              child: AnimatedSmoothIndicator(
                activeIndex: obcontroller.currentPage.value,
                count: 3,
                effect: const WormEffect(
                  activeDotColor: Color(0xFF32DE84),
                  dotColor: Color(0xff272727),
                  dotHeight: 5.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
