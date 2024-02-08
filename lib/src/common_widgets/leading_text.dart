import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/responsive/exporter.dart';

import '../../droidcon_exporter.dart';
import '../constants/exporter.dart';
import 'spaces.dart';

class LeadingText extends ConsumerWidget {
  const LeadingText({
    super.key,
    required this.title,
    required this.description,
    this.padding,
    this.textColor = tBlackColor,
    this.textAlign = TextAlign.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

// title text
  final String title;

  // description text
  final String description;

  // text color
  final Color textColor;

  //
  final EdgeInsetsGeometry? padding;

  final TextAlign? textAlign;

  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draaaftResponsive = ref.watch(droidconResponsiveProvider(context));

    final isMobile = draaaftResponsive.isMobileScreen;

    //
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(
              vertical: spacing24, horizontal: spacing16),
      child: Column(
        key: ValueKey(isMobile),
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: [
          // title
          Text(
            title,
            textAlign: textAlign,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: textColor,
              height: 1,
              fontSize: isMobile ? fontSize24 : fontSize20,
            ),
          ),
          const VerticalSpace(of: spacing8),
          // description
          Text(
            description,
            textAlign: textAlign,
            style: TextStyle(
              color: textColor,
              fontSize: isMobile ? fontSize16 : fontSize14,
            ),
          ),
          const VerticalSpace(of: spacing16),
        ],
      ),
    );
  }
}
