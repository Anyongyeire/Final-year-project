// Project imports:
import 'package:login_app/src/features/authentication/models/exporter.dart';

import '../../../droidcon_exporter.dart';
import 'text_fields/signup_fields.dart';

// auth error text provider
final authErrorTextProvider = StateProvider<String>((_) => '');

///Current Index of the auth pages
final authPageIndexProvider = StateProvider<int>((_) => 0);

// is login screen when authPageIndexProvider is 0
final isFromLoginProvider = Provider<bool>((ref) {
  final authPageIndex = ref.watch(authPageIndexProvider);
  return (authPageIndex == 0);
});

///Sign Up form
final signUpFormKeyProvider =
    Provider<GlobalKey<FormState>>((_) => GlobalKey<FormState>());

///Sign In Form
final loginFormKeyProvider =
    Provider<GlobalKey<FormState>>((_) => GlobalKey<FormState>());

///Forgot form
final forgotFormKeyProvider =
    Provider<GlobalKey<FormState>>((_) => GlobalKey<FormState>());

///whether the email to rest password has been sent
final isResetEmailSentProvider = StateProvider((ref) => false);

// sign up form provider
final signUpFormProvider = Provider<AppForm>((ref) {
  final signUpForm = AppForm(
    title: 'Sign Up',
    description: 'Create an account to get started',
    formKeyProvider: signUpFormKeyProvider,
    formFields: signUpFormFields,
  );

  return signUpForm;
});
