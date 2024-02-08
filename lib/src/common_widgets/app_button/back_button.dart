import '../../../droidcon_exporter.dart';

class AkataboBackButton extends StatelessWidget {
  const AkataboBackButton({
    super.key,
    this.path,
    this.iconColor,
  });

  // icon color
  final Color? iconColor;

  // go to path
  final String? path;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: "Back",
      icon: Icon(
        Icons.arrow_back_ios,
        color: iconColor,
      ),
      // TODO see if we can enhance this to allow on tap here instead
      onPressed: () => (path != null) ? context.go(path!) : context.pop(),
    );
  }
}
