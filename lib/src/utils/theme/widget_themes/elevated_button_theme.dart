import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._(); //* To avaid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: tWhiteColor,
      backgroundColor: tSecondaryColor,
      side: BorderSide(
        color: tSecondaryColor,
      ),
      padding: EdgeInsets.symmetric(
        vertical: tButtonHeight,
      ),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: tSecondaryColor,
      backgroundColor: tWhiteColor,
      side: BorderSide(
        color: tSecondaryColor,
      ),
      padding: EdgeInsets.symmetric(
        vertical: tButtonHeight,
      ),
    ),
  );
}
