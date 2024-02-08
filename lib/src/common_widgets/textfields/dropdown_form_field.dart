import 'package:flutter/cupertino.dart';

import '../../../droidcon_exporter.dart';
import '../../constants/exporter.dart';
import '../../features/authentication/models/exporter.dart';
import '../../utils/theme/colors.dart';
import '../spaces.dart';
import 'field_label.dart';

class DropdownFormField extends ConsumerWidget {
  const DropdownFormField({
    super.key,
    required this.formField,
  });

// form field
  final AppFormField formField;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // formvalue pass in the initial value here
    final fieldValue = ref.watch(formField.stateProvider);

    // sorted drop down items
    final sortedDropDownItems = formField.isGenderDropDown
        ? formField.sortedDropDownItems
        : formField.dropDownItems;

    // initial value will be the first item in the dropdown list only if the form value is empty ''
    final formValue =
        fieldValue.isEmpty ? sortedDropDownItems.first : fieldValue;

    //
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // label
        FormLabel(
          form: formField,
          labelText: formField.label,
        ),
        const VerticalSpace(of: spacing4),
        //
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: spacing2,
            horizontal: spacing8,
          ),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(.05),
            borderRadius:
                formField.hasFullRadius ? borderRadius120 : borderRadius8,
            border: Border.all(
              color: primaryColor,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const HorizontalSpace(of: spacing8),
              Expanded(
                child: DropdownButton<String>(
                  underline: const EmptySpace(),
                  borderRadius: borderRadius16,
                  value: formValue,
                  alignment: Alignment.centerRight,
                  focusColor: transparent,
                  style: GoogleFonts.lato(color: primaryColor),
                  menuMaxHeight: 500,
                  icon: const EmptySpace(),
                  onChanged: (newValue) {
                    ref.read(formField.stateProvider.notifier).state = newValue;
                  },
                  items: List.generate(
                    sortedDropDownItems.length,
                    (index) {
                      // chopped Value  this shows the value chopped to the first 20 characters and the rest represented by an ellipsis
                      // but first check if string hs more than 20 characters before we chop it
                      final value = sortedDropDownItems[index];
                      final choppedValue = value;

                      // if is selectGender disable it
                      final enabled = (value != selectGender);

                      return DropdownMenuItem<String>(
                        value: sortedDropDownItems[index],
                        enabled: enabled,
                        child: Text(choppedValue),
                      );
                    },
                  ),
                  selectedItemBuilder: (context) => List.generate(
                    sortedDropDownItems.length,
                    (index) {
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Text(formValue),
                      );
                    },
                  ),
                ),
              ),
              const HorizontalSpace(of: spacing8),
              const Icon(
                CupertinoIcons.chevron_down_circle_fill,
                color: primaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
