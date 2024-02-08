import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._(); //* To avaid creating instances

  /* -- Light Theme -- */
  static final lightOutlinededButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: tSecondaryColor,
      side: BorderSide(
        color: tSecondaryColor,
      ),
      padding: EdgeInsets.symmetric(
        vertical: tButtonHeight,
      ),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: tWhiteColor,
      side: BorderSide(
        color: tWhiteColor,
      ),
      padding: EdgeInsets.symmetric(
        vertical: tButtonHeight,
      ),
    ),
  );
}
