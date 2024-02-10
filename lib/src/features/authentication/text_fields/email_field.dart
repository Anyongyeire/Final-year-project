import '../../../../droidcon_exporter.dart';
import '../../../common_widgets/textfields/exporter.dart';
import 'textfields_riverpod.dart';

// email regex
final emailV = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

class EmailField extends ConsumerWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // emailProvider
    final email = ref.watch(emailProvider);

    return CustomTextField(
      labelText: "Email $email",
      hintText: "Enter your email",
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        ref.read(emailProvider.notifier).state = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Email is required";
        } else if (!emailV.hasMatch(value)) {
          return "Invalid email";
        }
      },
      restorationId: "email",
    );
  }
}
