// Flutter imports:

// Project imports:
import 'package:flutter/cupertino.dart';

import '../../../../droidcon_exporter.dart';
import '../../../common_widgets/textfields/exporter.dart';
import 'textfields_riverpod.dart';

// Email Verification RegExp
final emailExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

class ForgotEmailField extends ConsumerWidget {
  const ForgotEmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextField(
      restorationId: 'forgot_email_field',
      onChanged: (email) {
        if (emailExp.hasMatch(email)) {
          ref.read(forgotEmailProvider.notifier).state = email;
        }
      },
      validator: (email) {
        if (email == null || email.isEmpty) {
          return ' Please Enter your Email ';
        }

        if (!emailExp.hasMatch(email)) {
          return " Invalid Email Address ";
        }

        return null;
      },
      keyboardType: TextInputType.emailAddress,
      prefixIcon: CupertinoIcons.mail_solid,
      textInputAction: TextInputAction.done,
      hintText: 'Email',
      autofillHints: const [AutofillHints.email, AutofillHints.username],
      labelText: 'Email',
    );
  }
}
