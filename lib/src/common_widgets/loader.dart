import 'package:flutter/material.dart';
import './logo.dart';
import '../utils/theme/colors.dart';
import './spaces.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({
    super.key,
    this.iconColor = primaryColor,
  });

  // icon color
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Spacer(),
          Center(child: AppLogo(color: iconColor)),

          const Spacer(),
          Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                strokeWidth: 4,
                valueColor: AlwaysStoppedAnimation<Color>(iconColor),
              ),
            ),
          ),
          const VerticalSpace(of: 40.0) // ,Center
        ],
      ),
    );
  }
}
