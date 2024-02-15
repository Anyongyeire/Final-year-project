import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../../models/model_on_bording.dart';
import '../../../../constants/sizes.dart';

class OnBordingPageWidget extends StatelessWidget {
  const OnBordingPageWidget({
    super.key,
    required this.model,
  });

  final OnBordingModel model;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(tDefaultSize),
      color: model.bgcolor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(
            image: AssetImage(
              model.image,
            ),
            height: size.height * 0.4,
          ),
          Column(
            children: [
              Text(
                model
                    .title, //style: Colors.(color: isDarkMode ? tSecondaryColor : tPrimaryColor) ,
                // selectionColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: isDarkMode ? tSecondaryColor : tPrimaryColor,
                    ),
              ),
              Text(
                model.subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isDarkMode ? tSecondaryColor : tPrimaryColor,
                ),
              ),
            ],
          ),
          Text(
            model.counterText,
            // style: TextStyle(
            //   color: isDarkMode ? tSecondaryColor : tPrimaryColor,

            // ),
            style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: isDarkMode ? tSecondaryColor : tPrimaryColor,
                ),
          ),
          const SizedBox(
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
