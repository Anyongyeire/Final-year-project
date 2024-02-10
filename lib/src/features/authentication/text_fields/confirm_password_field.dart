// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:login_app/src/features/authentication/text_fields/textfields_riverpod.dart';

// Project imports:
import '../../../../droidcon_exporter.dart';
import '../../../common_widgets/textfields/exporter.dart';
import '../../../utils/theme/colors.dart';

class ConfirmPasswordField extends ConsumerStatefulWidget {
  const ConfirmPasswordField({
    super.key,
  });

  @override
  ConsumerState<ConfirmPasswordField> createState() =>
      _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends ConsumerState<ConfirmPasswordField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    //
    return CustomTextField(
      restorationId: 'confirm_password_field',
      onChanged: (confirmedPassword) {
        ref.read(confirmPasswordProvider.notifier).state = confirmedPassword;
      },
      validator: (confirmedPassword) {
        // password text
        final password = ref.watch(passwordProvider);

        if (confirmedPassword == null || confirmedPassword.isEmpty) {
          return "Confirm your Password.";
        }

        // check if the passwords match
        if (confirmedPassword != password) {
          return "Passwords do not match.";
        }

        return null;
      },
      keyboardType: TextInputType.visiblePassword,
      prefixIcon:
          isObscured ? CupertinoIcons.lock_fill : CupertinoIcons.lock_open_fill,
      labelText: 'Confirm Password',
      hintText: 'Confirm Password',
      suffixIcon: IconButton(
        icon: Icon(
          isObscured ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
          color: primaryColor,
        ),
        onPressed: () {
          setState(() {
            isObscured = !isObscured;
          });
        },
      ),
      autofillHints: const [AutofillHints.password],
      obscureText: isObscured,
      textInputAction: TextInputAction.done,
    );
  }
}
