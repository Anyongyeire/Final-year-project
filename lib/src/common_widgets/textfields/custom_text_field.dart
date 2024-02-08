// Flutter imports:
import 'package:flutter/services.dart';
import 'package:login_app/src/constants/exporter.dart';

import '../../../../droidcon_exporter.dart';
import '../../utils/theme/colors.dart';
import '../spaces.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    required this.onChanged,
    required this.restorationId,
    this.labelText = '',
    this.prefixIcon,
    this.onFieldSubmitted,
    this.obscuringCharacter,
    this.obscureText = false,
    this.initialValue,
    this.fillColor = primaryColor,
    this.textColor = black,
    this.labelTextColor = black,
    this.numLines = 1,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.fieldTextStyle,
    this.controller,
    this.autofillHints,
    this.maxLength,
    this.suffixIcon,
    this.inputFormatters,
    this.prefixText,
    this.borderColor,
    this.customLabel,
    this.borderRadius = borderRadius120,
  });

  final String? initialValue;
  final TextStyle? fieldTextStyle;
  final int numLines;
  final int? maxLength;
  final String? Function(String? value)? validator;
  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  final List<String>? autofillHints;
  final bool obscureText;
  final TextInputType keyboardType;

  // action to be shown on the soft keyboard
  final TextInputAction textInputAction;
  final Color fillColor, textColor, labelTextColor;

  final Color? borderColor;

  //
  final Widget? suffixIcon;

  // this is for customising the label of this field
  final Widget? customLabel;

  final IconData? prefixIcon;

  // on field submitted
  final ValueChanged<String>? onFieldSubmitted, onChanged;

  //
  final List<TextInputFormatter>? inputFormatters;

  // restoration id
  final String restorationId;

  final String? prefixText;

  final String? obscuringCharacter;

  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final fieldStyle =
        fieldTextStyle ?? TextStyle(fontSize: fontSize14, color: textColor);

    //
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // label
        customLabel ??
            Text(
              labelText,
              style: TextStyle(
                fontSize: fontSize14,
                color: labelTextColor,
              ),
            ),

        const VerticalSpace(of: spacing4),
        // text field
        TextFormField(
          restorationId: restorationId,
          controller: controller,
          autofillHints: autofillHints,
          inputFormatters: inputFormatters ??
              [
                LengthLimitingTextInputFormatter(maxLength),
              ],
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
          onChanged: onChanged,
          initialValue: initialValue,
          style: fieldStyle,
          autofocus: false,
          minLines: numLines,
          maxLines: numLines,
          maxLength: maxLength,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          obscureText: obscureText,

          // decoration
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: fieldStyle.copyWith(
              color: textColor.withOpacity(.5),
            ),
            filled: true,
            fillColor: fillColor.withOpacity(.05),
            // * Error Styling
            errorMaxLines: 5,
            errorStyle: const TextStyle(color: red),
            errorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: const BorderSide(
                color: red,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: const BorderSide(
                color: red,
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
            // * Normal Styling
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(
                color: borderColor ?? fillColor,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: const BorderSide(
                color: primaryColor,
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
            isDense: true,

            //* Icons
            prefixIcon: (prefixIcon == null)
                ? null
                : Icon(
                    prefixIcon,
                    color: fillColor,
                  ),
            suffixIcon: suffixIcon,
            suffixIconColor: fillColor,

            //* prefix
            prefixText: prefixText,
            prefixStyle: fieldStyle,
          ),
          obscuringCharacter: obscuringCharacter ?? '◉',
          autovalidateMode: AutovalidateMode.onUserInteraction,

          // * cursor
          cursorColor: textColor,
          cursorRadius: const Radius.circular(12),
          textInputAction: textInputAction,
          //
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
