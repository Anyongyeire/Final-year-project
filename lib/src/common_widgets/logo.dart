import 'package:flutter/material.dart';
export 'package:animations/animations.dart';
import '../utils/theme/colors.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.logoSize = 100.0,
    this.isGreen = true,
    this.color,
  });

  // width and height
  final double logoSize;

  // is green
  final bool isGreen;

  // color
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      clipBehavior: Clip.antiAlias,
      child: Icon(
        Icons.android,
        semanticLabel: 'Droidcon Logo',
        color: color ?? (isGreen ? primaryColor : white),
        size: logoSize,
      ),
    );
  }
}

class PaddedLogo extends StatelessWidget {
  const PaddedLogo({
    super.key,
    this.logoSize = 100.0,
    this.padding = const EdgeInsets.all(16.0),
    this.isGreen = true,
  });

  // icon size
  final double logoSize;

  // is green
  final bool isGreen;

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Center(
        child: AppLogo(
          logoSize: logoSize,
          isGreen: isGreen,
        ),
      ),
    );
  }
}
