import 'auth_credentials.dart';

class AppUser {
  final String username;
  final String firstName, lastName;
  final String gender;
  final DateTime? dateOfBirth;
  final String nationalId;
  final String email;
  final String phoneNumber;
  final String region;
  final String district;
  final String county;
  final String subCounty;
  final String village;
  final String password;

  AppUser({
    this.username = "",
    this.firstName = "",
    this.lastName = "",
    this.gender = "",
    this.nationalId = "",
    this.email = "",
    this.phoneNumber = "",
    this.region = "",
    this.dateOfBirth,
    this.district = "",
    this.county = "",
    this.subCounty = "",
    this.village = "",
    this.password = "",
  });

  // from LoginCredentials
  factory AppUser.fromLoginCredentials(LoginCredentials logins) {
    return AppUser(username: logins.username, password: logins.password);
  }

  // from SignUpCredentials
  factory AppUser.fromSignUpCredentials(SignUpCredentials signups) {
    return AppUser(
      firstName: signups.firstName,
      lastName: signups.lastName,
      username: signups.username,
      gender: signups.gender,
      dateOfBirth: signups.dateOfBirth,
      nationalId: signups.nationalId,
      email: signups.email,
      phoneNumber: signups.phoneNumber,
      region: signups.region,
      district: signups.district,
      county: signups.county,
      subCounty: signups.subCounty,
      village: signups.village,
      password: signups.password,
    );
  }
}
