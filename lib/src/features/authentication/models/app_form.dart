import '../../../../droidcon_exporter.dart';
import 'exporter.dart';

class AppForm {
  // title
  final String title;
  // description
  final String description;
  // form key
  final Provider<GlobalKey<FormState>> formKeyProvider;

  // list of AppFormField
  final List<AppFormField> formFields;

  // form submit function
  // final Future<Response> Function() submit;

  AppForm({
    required this.title,
    required this.description,
    required this.formKeyProvider,
    required this.formFields,
    // required this.submit,
  });
}
