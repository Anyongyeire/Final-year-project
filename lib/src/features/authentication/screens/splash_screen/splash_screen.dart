// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/constants/exporter.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import '../../../../common_widgets/fade_in_animation/animation_design.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';

// import '../../../../constants/image_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // @override
  // void initState() {
  //   startAnimation();
  // }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TFadeInAnimationController());
    controller.startSplashAnimation();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            TFadeInAnimation(
              durationInMs: 1600,
              animatePosition: TAnimatePosition(
                topAfter: 0,
                topBefore: -30,
                leftBefore: -30,
                leftAfter: 0,
              ),
              child: const Icon(
                Icons.cloud_done,
                size: 100.0,
                color: tPrimaryColor,
              ),
            ),
            TFadeInAnimation(
              durationInMs: 2000,
              animatePosition: TAnimatePosition(
                topBefore: 80,
                topAfter: 80,
                leftAfter: tDefaultSize,
                leftBefore: -80,
              ),
              // child: Obx(
              //   () => AnimatedPositioned(
              //     duration: const Duration(milliseconds: 1600),
              //     top: 80,
              //     left: TFadeInAnimationController.animate.value ? tDefaultSize : -80,
              //     child: AnimatedOpacity(
              //       duration: const Duration(milliseconds: 1600),
              //       opacity: TFadeInAnimationController.animate.value ? 1 : 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tAppName,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    tAppTagLine,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
                // ),
                //   ),
                // ),
              ),
            ),
            TFadeInAnimation(
              durationInMs: 2400,
              animatePosition:
                  TAnimatePosition(bottomBefore: 0, bottomAfter: 100),
              // bottom: splashScreenController.animate.value ? 100 : 0,
              // left: -38,
              // child: AnimatedOpacity(
              //   duration: const Duration(milliseconds: 2000),
              //   opacity: splashScreenController.animate.value ? 1 : 0,
              child: const Center(
                child: Image(
                  image: AssetImage(tSplashImage),
                  width: 400.0,
                  height: 400.0,
                  // color: tPrimaryColor,
                ),
              ),
              // child: const Icon(
              //   Icons.how_to_vote_sharp,
              //   size: 450.0,
              //   color: tPrimaryColor,
              // ),
            ),
            TFadeInAnimation(
              durationInMs: 2400,
              animatePosition: TAnimatePosition(
                bottomBefore: 0,
                bottomAfter: 60,
                rightBefore: tDefaultSize,
                rightAfter: tDefaultSize,
              ),
              // right: tDefaultSize,
              // child: AnimatedOpacity(
              //   duration: const Duration(milliseconds: 2000),
              //   opacity: splashScreenController.animate.value ? 1 : 0,
              child: Container(
                width: tSplashContainerSize,
                height: tSplashContainerSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: tPrimaryColor,
                ),
                child: const ClipOval(
                  child: Image(image: AssetImage(tSplashLogo)),
                ),
              ),
            ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
