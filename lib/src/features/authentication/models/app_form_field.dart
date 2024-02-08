// a form field has a label, description, isMandatory and a state provider attached to it
import '../../../../droidcon_exporter.dart';

class AppFormField {
  // form field label
  final String label;

  // hint
  final String hint;

  // if this is mandatory or optional
  final bool isMandatory;

  // for state management
  final StateProvider stateProvider;

  // max lines
  final int maxLines;

  // max lines
  final int? maxLength;

  // whether to capture this as a text (TextInputType.text) or an integer (TextInputType.number)
  final TextInputType keyboardType;

  // action performed by this field
  final TextInputAction textInputAction;

  // validator regex string
  final RegExp? validatorRegex;

  // list of drop down items incase its a drop down field
  final List<String> dropDownItems;

  // field type
  final FieldType fieldType;

  // icon
  final IconData? prefixIcon;

  // autofill hints
  final List<String>? autofillHints;

  final bool hasFullRadius, isGenderDropDown;

  AppFormField({
    required this.label,
    required this.hint,
    required this.stateProvider,
    this.isGenderDropDown = true,
    this.isMandatory = true,
    this.hasFullRadius = true,
    this.maxLines = 1,
    this.maxLength,
    this.validatorRegex,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.fieldType = FieldType.text,
    this.dropDownItems = const [],
    this.prefixIcon,
    this.autofillHints = const [],
  });

  // is a dropdown field
  bool get isDropdownField =>
      (fieldType == FieldType.dropdown) && dropDownItems.isNotEmpty;

  // is a date field
  bool get isDateField => fieldType == FieldType.date;

  // is a file fields
  bool get isFileField => fieldType == FieldType.file;

  // dropDownItems in alphabetical order
  List<String> get sortedDropDownItems => dropDownItems..sort();
}

// enum of form field types, its either a text field, a dropdown or a date picker
enum FieldType {
  text,
  dropdown,
  date,
  file,
  gnutVarietyDropdown,
}
