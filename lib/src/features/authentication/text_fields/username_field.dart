// Flutter imports:

// Project imports:
import 'package:flutter/cupertino.dart';

import '../../../../droidcon_exporter.dart';
import '../../../common_widgets/textfields/exporter.dart';
import 'textfields_riverpod.dart';

class UsernameField extends ConsumerWidget {
  const UsernameField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    return CustomTextField(
      restorationId: 'username_field',
      onChanged: (username) {
        ref.read(userNameProvider.notifier).state = username;
      },
      validator: (username) {
        if (username == null || username.isEmpty) {
          return "Your Username is Required e.g. Cephas ";
        }

        return null;
      },
      keyboardType: TextInputType.name,
      prefixIcon: CupertinoIcons.person,
      hintText: 'Username',
      autofillHints: const [AutofillHints.name, AutofillHints.username],
      labelText: 'Username',
    );
  }
}
