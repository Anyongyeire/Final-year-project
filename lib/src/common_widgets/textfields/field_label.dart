import '../../../droidcon_exporter.dart';
import '../../constants/exporter.dart';
import '../../features/authentication/models/exporter.dart';
import '../../utils/theme/colors.dart';
import '../spaces.dart';
import 'exporter.dart';

class FormLabel extends StatelessWidget {
  const FormLabel({
    super.key,
    required this.form,
    required this.labelText,
    this.labelTextColor = black,
  });

  // form
  final AppFormField form;

  // label text
  final String labelText;

  // label color
  final Color labelTextColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // label
        Expanded(
          child: Text(
            labelText,
            style: TextStyle(
              fontSize: fontSize16,
              fontWeight: FontWeight.bold,
              color: labelTextColor,
            ),
          ),
        ),

        const HorizontalSpace(of: spacing4),

        // pill like chip to show required or optional
        RequiredOptionalText(isRequired: form.isMandatory)
      ],
    );
  }
}
