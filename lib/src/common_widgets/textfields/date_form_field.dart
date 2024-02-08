import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../../droidcon_exporter.dart';
import '../../constants/exporter.dart';
import '../../features/authentication/models/exporter.dart';
import '../../functions/exporter.dart';
import '../../utils/theme/colors.dart';
import '../spaces.dart';
import 'field_label.dart';

class DateFormField extends ConsumerWidget {
  const DateFormField({
    super.key,
    required this.formField,
  });

// form field
  final AppFormField formField;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // formvalue
    final formValue = ref.watch(formField.stateProvider);

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
        InkWell(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: formValue,
              firstDate: DateTime(2000),
              lastDate: DateTime.now(),
            );

            if (pickedDate != null) {
              //pickedDate output format => 2021-03-10 00:00:00.000
              printer(pickedDate);
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
              //formatted date output using intl package =>  2021-03-16
              printer(formattedDate);

              ref.read(formField.stateProvider.notifier).state = pickedDate;
            }
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: primaryColor,
                width: 1,
              ),
              borderRadius:
                  formField.hasFullRadius ? borderRadius120 : borderRadius8,
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // calender icon
                const Icon(
                  CupertinoIcons.calendar,
                  color: primaryColor,
                ),
                const HorizontalSpace(of: spacing8),
                Expanded(
                  child: Text(
                    formValue == null
                        ? formField.hint
                        : DateFormat.yMMMMEEEEd().format(formValue),
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
