import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class TTextFormField {
  TTextFormField._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    labelStyle: const TextStyle(color: tSecondaryColor),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        color: tSecondaryColor,
      ),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    labelStyle: const TextStyle(color: tPrimaryColor),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        color: tPrimaryColor,
      ),
    ),
  );
}
