import 'package:flutter/material.dart';
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
    final size = MediaQuery.of(context).size;
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
                model.title,
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                model.subTitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Text(
            model.counterText,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
