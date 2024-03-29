import '../../../droidcon_exporter.dart';
import '../../constants/exporter.dart';
import '../../responsive/exporter.dart';

class ButtonBody extends ConsumerWidget {
  const ButtonBody({
    super.key,
    required this.buttonColor,
    required this.toolTip,
    required this.text,
    required this.textColor,
    required this.iconData,
    required this.onTap,
    this.iconWidget,
    required this.isSmallButton,
  });

  final bool isSmallButton;

  final Color buttonColor;
  final String? toolTip;
  final String text;
  final Color textColor;
  final IconData? iconData;
  final VoidCallback? onTap;

  final Widget? iconWidget;

  @override
  Widget build(BuildContext context, ref) {
    VisualDensity density = Theme.of(context).visualDensity;

    final width = MediaQuery.of(context).size.width;

    final droidconResponsive = ref.watch(droidconResponsiveProvider(context));

    final isDesktop = droidconResponsive.isDesktopScreen;
    final isMobile = droidconResponsive.isMobileScreen;

    /// True if It has an Icon
    final hasIconData = (iconData != null);
    final hasIconWidget = (iconWidget != null);
    final hasIcon = (hasIconData || hasIconWidget);

    // elevation
    const elevation = spacing0;

    //
    var buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: buttonColor,
      foregroundColor: textColor,
      elevation: elevation,
      shape: const StadiumBorder(),
      shadowColor: textColor.withOpacity(.2),
      visualDensity: density,
      textStyle: TextStyle(
        fontSize: isDesktop ? 16 : 14,
        fontWeight: FontWeight.w600,
      ),
    );

    //
    return AnimatedContainer(
      width: isSmallButton ? null : (isMobile ? width : maxAuthWidth),
      duration: fiftyMilliseconds,
      // for good looking UI o mobile we set this height to 42
      height: isDesktop ? kDesktopButtonHeight : kButtonHeight,
      child: Tooltip(
        message: toolTip ?? text,
        textStyle: TextStyle(color: buttonColor),
        decoration: BoxDecoration(
          color: textColor,
          borderRadius: borderRadius4,
        ),
        child: hasIcon
            ? ElevatedButton.icon(
                onPressed: onTap,
                style: buttonStyle,
                label: Text(
                  text,
                  maxLines: 1,
                ),
                icon: iconWidget ?? Icon(iconData, color: textColor),
              )
            : ElevatedButton(
                onPressed: onTap,
                style: buttonStyle,
                child: Text(
                  text,
                  maxLines: 1,
                ),
              ),
      ),
    );
  }
}
