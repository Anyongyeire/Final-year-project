import 'package:flutter/material.dart';

import 'dart:math' as math;

// droidcon Color
const primaryColor = Color(0xFF32DE84);

// droidcon secondary color
const secondaryColor = Color(0xFF000000);

// droidcon background
const backgroundColor = Color.fromARGB(255, 230, 227, 233);

// droidcon white
const white = Color(0xFFFFFFFF);

// red
const red = Color(0xFFCD0000);

// error color
const errorColor = Color(0xFF8A0301);

// error yellow
const errorYellow = Color(0xFFFFFF00);

// droidcon black
const black = Color(0xFF000000);

// droidcon transparent
const transparent = Colors.transparent;

// droidcon random color
Color get randomColor =>
    Color((math.Random().nextDouble() * 0xFFE3EEFE).toInt()).withOpacity(1.0);
