import '../../../droidcon_exporter.dart';
import '../../constants/exporter.dart';
import '../../responsive/exporter.dart';
import '../../utils/theme/colors.dart';

class AppTextButton extends ConsumerWidget {
  const AppTextButton({
    super.key,
    required this.onTap,
    this.textColor = primaryColor,
    this.buttonColor = transparent,
    required this.label,
    this.toolTip,
    this.icon,
    this.tooltipTextColor,
  });

  final VoidCallback onTap;
  final Color textColor, buttonColor;

  final Color? tooltipTextColor;

  // text: The text to be displayed on the button
  final String label;

// tooltip: The tooltip to show when the user hovers over the button.
  final String? toolTip;

  final IconData? icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// True if It has an Icon
    final hasIcon = (icon != null);
    VisualDensity density = Theme.of(context).visualDensity;

    final droidconResponsive = ref.watch(droidconResponsiveProvider(context));

    final isDesktop = droidconResponsive.isDesktopScreen;
    //
    final buttonStyle = TextButton.styleFrom(
      backgroundColor: buttonColor,
      foregroundColor: textColor,
      shape: const StadiumBorder(),
      shadowColor: textColor.withOpacity(.2),
      visualDensity: density,
      textStyle: TextStyle(
        fontSize: isDesktop ? 16 : 14,
        fontWeight: FontWeight.w600,
      ),
    );

    return Tooltip(
      message: toolTip ?? label,
      textStyle: TextStyle(color: tooltipTextColor ?? buttonColor),
      decoration: BoxDecoration(
        color: textColor,
        borderRadius: borderRadius4,
      ),
      child: hasIcon
          ? TextButton.icon(
              onPressed: onTap,
              style: buttonStyle,
              label: Text(
                label,
                maxLines: 1,
              ),
              icon: Icon(icon, color: textColor),
            )
          : TextButton(
              onPressed: onTap,
              style: buttonStyle,
              child: Text(
                label,
                maxLines: 1,
              ),
            ),
    );
  }
}
