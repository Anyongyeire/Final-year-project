import '../../../droidcon_exporter.dart';
import '../../constants/exporter.dart';
import '../../features/authentication/models/app_form_field.dart';
import 'exporter.dart';

class AppFormFieldWidget extends ConsumerWidget {
  const AppFormFieldWidget({required this.formField, super.key});

// form field
  final AppFormField formField;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    return Padding(
      padding: verticalPadding16,
      child: formFieldWidget(formField),
    );
  }

  Widget formFieldWidget(AppFormField formField) {
    switch (formField.fieldType) {
      case FieldType.date:
        return DateFormField(formField: formField);
      case FieldType.dropdown:
        return DropdownFormField(formField: formField);
      default:
        return AppTextFormField(formField: formField);
    }
  }
}
