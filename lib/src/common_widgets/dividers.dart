// Project imports:

import '../../droidcon_exporter.dart';
import '../constants/colors.dart';
import '../constants/dimens.dart';
import '../utils/theme/colors.dart';

///this is a horizontal divider
class ThickHorizontalDivider extends StatelessWidget {
  const ThickHorizontalDivider({
    super.key,
    this.dividerColor = tPrimaryColor,
    this.thickness = kDividerThickness,
    this.dividerWidth = kHorizontalDividerWidth,
    this.margin = const EdgeInsets.symmetric(vertical: 16.0),
  });

//color of the divider
  final Color dividerColor;

  // divider width
  final double dividerWidth;

  /// divider height
  final double thickness;

  // margin
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: thickness,
      width: dividerWidth,
      decoration: BoxDecoration(
        color: dividerColor,
        borderRadius: BorderRadius.circular(thickness / 2),
      ),
    );
  }
}

///this is a horizontal divider
class SliverThickHorizontalDivider extends StatelessWidget {
  const SliverThickHorizontalDivider({
    super.key,
    this.dividerColor = primaryColor,
    this.thickness = kDividerThickness,
    this.dividerWidth = kHorizontalDividerWidth,
    this.margin = const EdgeInsets.symmetric(vertical: 16.0),
  });

//color of the divider
  final Color dividerColor;

  // divider width
  final double dividerWidth;

  /// divider height
  final double thickness;

  // margin
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ThickHorizontalDivider(
        margin: margin,
        thickness: thickness,
        dividerWidth: dividerWidth,
        dividerColor: dividerColor,
      ),
    );
  }
}

///this is a vertical divider
class ThickVerticalDivider extends StatelessWidget {
  const ThickVerticalDivider({
    super.key,
    this.dividerColor = primaryColor,
    this.thickness = kDividerThickness,
    this.dividerHeight = kVerticalDividerHeight,
    this.margin = const EdgeInsets.symmetric(vertical: 16.0),
  });

//color of the divider
  final Color dividerColor;

  // divider width
  final double dividerHeight;

  /// divider height
  final double thickness;

  // margin
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: dividerHeight,
      width: thickness,
      decoration: BoxDecoration(
        color: dividerColor,
        borderRadius: BorderRadius.circular(thickness / 2),
      ),
    );
  }
}

class SliverThickVerticalDivider extends StatelessWidget {
  const SliverThickVerticalDivider({
    super.key,
    this.dividerColor = primaryColor,
    this.thickness = kDividerThickness,
    this.dividerHeight = kVerticalDividerHeight,
    this.margin = const EdgeInsets.symmetric(vertical: 16.0),
  });

//color of the divider
  final Color dividerColor;

  // divider width
  final double dividerHeight;

  /// divider height
  final double thickness;

  // margin
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ThickVerticalDivider(
        margin: margin,
        dividerHeight: dividerHeight,
        thickness: thickness,
        dividerColor: dividerColor,
      ),
    );
  }
}
