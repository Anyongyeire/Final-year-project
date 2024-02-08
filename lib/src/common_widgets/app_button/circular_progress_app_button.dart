import 'package:login_app/src/common_widgets/app_button/exporter.dart';

import '../../../droidcon_exporter.dart';
import '../../constants/exporter.dart';
import '../../utils/theme/colors.dart';

class CircularProgressAppButton extends StatelessWidget {
  const CircularProgressAppButton({
    super.key,
    required this.isTapped,
    required this.onTap,
    required this.text,
    this.textColor = white,
    this.buttonColor = primaryColor,
    this.icon,
    this.toolTip,
    this.iconWidget,
  });
  final bool isTapped;
  final VoidCallback? onTap;
  final String text;
  final Color textColor, buttonColor;
  final IconData? icon;
  final String? toolTip;

  // this will be rendered incase the icon is not provided
  final Widget? iconWidget;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: quarterSeconds,
      child: isTapped
          ? Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: buttonColor,
              ),
              child: CircularProgressIndicator(color: textColor),
            )
          : AppButton(
              label: text,
              onTap: onTap,
              toolTip: toolTip,
              icon: icon,
              textColor: textColor,
              buttonColor: buttonColor,
              iconWidget: iconWidget,
            ),
    );
  }
}
