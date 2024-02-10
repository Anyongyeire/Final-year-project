import 'package:login_app/src/features/authentication/auth_providers.dart';

import '../../../../droidcon_exporter.dart';
import '../../../constants/exporter.dart';
import '../models/exporter.dart';

///Email
final emailProvider = StateProvider<String>((ref) => '');

// forgot password email
final forgotEmailProvider = StateProvider<String>((ref) => '');

// first name
final firstNameProvider = StateProvider<String>((ref) => '');
// last name
final lastNameProvider = StateProvider<String>((ref) => '');

// username
final userNameProvider = StateProvider<String>((ref) => '');

// password
final passwordProvider = StateProvider<String>((ref) => '');

// confirm password
final confirmPasswordProvider = StateProvider<String>((ref) => '');

// is password confirmed
final isPasswordConfirmedProvider = StateProvider<bool>((ref) {
  // password text
  final password = ref.watch(passwordProvider);

  // confirm password text
  final confirmPassword = ref.watch(confirmPasswordProvider);

  // return true if password and confirm password are equal
  return (password == confirmPassword);
});

// region
final regionProvider = StateProvider<String>((ref) => "");

// district
final districtProvider = StateProvider<String>((ref) => "");

// village
final villageProvider = StateProvider<String>((ref) => "");

// county
final countyProvider = StateProvider<String>((ref) => "");

// subCounty
final subCountyProvider = StateProvider<String>((ref) => "");

// phone number
final phoneNumberProvider = StateProvider<String>((ref) => "");
// nationalId
final nationalIdProvider = StateProvider<String>((ref) => "");

final dateOfBirthProvider = StateProvider<DateTime>((_) => DateTime.now());

// gender
final genderProvider = StateProvider<String>((ref) => selectGender);

// * Auth Credentials -----

// * Sign Up Credentials
final signUpCredentialsProvider = Provider<SignUpCredentials>((ref) {
  // Credentials
  final email = ref.watch(emailProvider);
  final firstName = ref.watch(firstNameProvider);
  final lastName = ref.watch(lastNameProvider);
  final username = ref.watch(userNameProvider);
  final password = ref.watch(passwordProvider);
  // gender
  final gender = ref.watch(genderProvider);
  // phone number
  final phoneNumber = ref.watch(phoneNumberProvider);
  // district
  final district = ref.watch(districtProvider);
  // subCounty
  final subCounty = ref.watch(subCountyProvider);
  // village
  final village = ref.watch(villageProvider);
  // dateOfBirth
  final dateOfBirth = ref.watch(dateOfBirthProvider);
  // dateOfBirth
  final nationalId = ref.watch(nationalIdProvider);
  // region
  final region = ref.watch(regionProvider);
  // county
  final county = ref.watch(countyProvider);

  return SignUpCredentials(
    firstName: firstName,
    lastName: lastName,
    username: username,
    gender: gender,
    dateOfBirth: dateOfBirth,
    nationalId: nationalId,
    email: email,
    phoneNumber: phoneNumber,
    region: region,
    district: district,
    county: county,
    subCounty: subCounty,
    village: village,
    password: password,
  );
});

// * Login Credentials
final loginCredentialsProvider = Provider<LoginCredentials>((ref) {
  // Credentials
  final username = ref.watch(userNameProvider);
  final password = ref.watch(passwordProvider);

  return LoginCredentials(
    username: username,
    password: password,
  );
});

// * Current App User
final currentUserProvider = Provider<AppUser>((ref) {
  // is login
  final isLogin = ref.watch(isFromLoginProvider);

  // Credentials
  final loginCredentials = ref.watch(loginCredentialsProvider);
  final signUpCredentials = ref.watch(signUpCredentialsProvider);

  // return the user accordingly
  return isLogin
      ? AppUser.fromLoginCredentials(loginCredentials)
      : AppUser.fromSignUpCredentials(signUpCredentials);
});

// reset all login provider values to the default ones
void resetAuthProviders(WidgetRef ref) {
  // reset all the providers
  ref.read(emailProvider.notifier).state = '';
  ref.read(forgotEmailProvider.notifier).state = '';
  ref.read(firstNameProvider.notifier).state = '';
  ref.read(lastNameProvider.notifier).state = '';
  ref.read(userNameProvider.notifier).state = '';
  ref.read(passwordProvider.notifier).state = '';
  ref.read(confirmPasswordProvider.notifier).state = '';
  ref.read(isPasswordConfirmedProvider.notifier).state = false;
  ref.read(regionProvider.notifier).state = '';
  ref.read(districtProvider.notifier).state = '';
  ref.read(villageProvider.notifier).state = '';
  ref.read(countyProvider.notifier).state = '';
  ref.read(subCountyProvider.notifier).state = '';
  ref.read(phoneNumberProvider.notifier).state = '';
  ref.read(nationalIdProvider.notifier).state = '';
  ref.read(dateOfBirthProvider.notifier).state = DateTime.now();
  ref.read(genderProvider.notifier).state = selectGender;
  // ref.read(authErrorTextProvider.notifier).state = '';
  // ref.read(authPageIndexProvider.notifier).state = 0;
  // ref.read(isResetEmailSentProvider.notifier).state = false;
}
