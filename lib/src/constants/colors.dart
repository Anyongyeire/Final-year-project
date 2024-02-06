import 'package:flutter/material.dart';

import 'dart:math' as math;

// loginApp Color
const tPrimaryColor = Color(0xFF32DE84);

// loginApp secondary color
const tSecondaryColor = Color(0xFF000000);

// loginApp secondary color
const tAccentColor = Color(0xFF000000);

const tCardBgColor = Color(0xFFF7F6F1);

// loginApp background
const backgroundColor = Color(0xFF200E32);

// loginApp white
const iWhiteColor = Color(0xFFFFFFFF);

// red
const red = Color(0xFFCD0000);

// error color
const errorColor = Color(0xFF8A0301);

// error yellow
const errorYellow = Color(0xFFFFFF00);

// loginApp black
const tBlackColor = Color(0xFF000000);

// loginApp transparent
const transparent = Colors.transparent;

// loginApp On.Bording.Colors
const tOnBordingPage1Color = Colors.white;
const tOnBordingPage2Color = Color(0xfffddcdf);
const tOnBordingPage3Color = Color(0xffffdcbd);

// loginApp random color
Color get randomColor =>
    Color((math.Random().nextDouble() * 0xFFE3EEFE).toInt()).withOpacity(1.0);
