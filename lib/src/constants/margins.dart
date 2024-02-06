import 'package:flutter/material.dart';

import './spacing.dart';

//* Margins following the 8px grid system

/// 32 margin
const EdgeInsets margin32 = EdgeInsets.all(spacing32);

/// 16 margin
const EdgeInsets margin16 = EdgeInsets.all(spacing16);

// 8 margin
const EdgeInsets margin8 = EdgeInsets.all(spacing8);

// 4 margin
const EdgeInsets margin4 = EdgeInsets.all(spacing4);

// 2 margin
const EdgeInsets margin2 = EdgeInsets.all(spacing2);

// 0 margin
const EdgeInsets margin0 = EdgeInsets.zero;

// toast margin, bottom 64, left and right 16,
const EdgeInsets toastMargin =
    EdgeInsets.only(bottom: spacing64, left: spacing16, right: spacing16);
