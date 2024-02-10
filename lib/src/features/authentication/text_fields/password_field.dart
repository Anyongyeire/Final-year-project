// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import '../../../../droidcon_exporter.dart';
import '../../../common_widgets/textfields/exporter.dart';
import '../../../utils/theme/colors.dart';
import 'textfields_riverpod.dart';

// password regex
final passwordRegex = RegExp(
  r'^(?=.*[a-zA-Z0-9])[a-zA-Z0-9!@#\$%\^&\*]+$',
);

class PasswordField extends ConsumerStatefulWidget {
  const PasswordField({
    super.key,
    this.isSignUpScreen = false,
  });

// check whether we are on Sign In Screen
  final bool isSignUpScreen;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends ConsumerState<PasswordField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      restorationId: 'password_field',
      onChanged: (password) {
        ref.read(passwordProvider.notifier).state = password;
      },
      validator: (password) {
        if (password == null || password.isEmpty) {
          return "Password is required. ";
        }

        // check if we are on Sign Up Screen
        if (widget.isSignUpScreen) {
          if (!passwordRegex.hasMatch(password)) {
            return "Choose a Stronger Password with at least 8 characters, 1 uppercase, 1 lowercase, 1 number and 1 special character. e.g #@!\\\$%^&*";
          }
        }

        return null;
      },
      keyboardType: TextInputType.visiblePassword,
      prefixIcon:
          isObscured ? CupertinoIcons.lock_fill : CupertinoIcons.lock_open_fill,
      labelText: 'Password',
      hintText: 'Password',
      suffixIcon: IconButton(
        icon: Icon(
          isObscured ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
          color: primaryColor,
          semanticLabel: isObscured ? 'show password' : 'hide password',
        ),
        onPressed: () {
          setState(() {
            isObscured = !isObscured;
          });
        },
      ),
      autofillHints: [
        if (widget.isSignUpScreen) AutofillHints.newPassword,
      ],
      obscureText: isObscured,
      textInputAction: TextInputAction.done,
    );
  }
}
