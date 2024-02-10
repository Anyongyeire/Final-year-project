import 'package:flutter/material.dart';

import '../../../../constants/exporter.dart';
import '../../../../constants/image_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: const AssetImage(
            tWelcomeScreenImage1,
          ),
          height: size.height * 0.3,
        ),
        Text(
          tLogninTitle,
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          tLoginSubtitle,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
