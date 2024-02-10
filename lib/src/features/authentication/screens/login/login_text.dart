import '../../../../../droidcon_exporter.dart';
import '../../components/auth_heading.dart';
import '../../text_fields/textfields_riverpod.dart';

class LoginText extends ConsumerWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // username
    final email = ref.watch(emailProvider);

    // login text, check if username is empty, show Login else add a name
    final loginText = (email.isEmpty) ? "Login" : "Hey $email,\nWelcome Back!";

    return AuthHeader(heading: loginText);
  }
}
