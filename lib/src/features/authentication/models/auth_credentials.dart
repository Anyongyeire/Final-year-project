class SignUpCredentials {
  final String username;
  final String firstName, lastName;
  final String gender;
  final DateTime dateOfBirth;
  final String nationalId;
  final String email;
  final String phoneNumber;
  final String region;
  final String district;
  final String county;
  final String subCounty;
  final String village;
  final String password;

  SignUpCredentials({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.gender,
    required this.dateOfBirth,
    required this.nationalId,
    required this.email,
    required this.phoneNumber,
    required this.region,
    required this.district,
    required this.county,
    required this.subCounty,
    required this.village,
    required this.password,
  });

  // get the form as json
  Map<String, dynamic> get asMap => toMap();

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'username': username});
    result.addAll({'gender': gender});
    result.addAll({'dateOfBirth': dateOfBirth.millisecondsSinceEpoch});
    result.addAll({'nationalId': nationalId});
    result.addAll({'email': email});
    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'region': region});
    result.addAll({'district': district});
    result.addAll({'county': county});
    result.addAll({'subCounty': subCounty});
    result.addAll({'village': village});
    result.addAll({'password': password});

    return result;
  }

  @override
  String toString() {
    return 'SignUpCredentials(username: $username, name: $firstName - $lastName , gender: $gender, dateOfBirth: $dateOfBirth, nationalId: $nationalId, email: $email, phoneNumber: $phoneNumber, region: $region, district: $district, county: $county, subCounty: $subCounty, village: $village,  password: $password)';
  }
}

// * Login Credentials
class LoginCredentials {
  // email
  final String username;
  // password
  final String password;

  LoginCredentials({
    required this.username,
    required this.password,
  });

  // get the form as json
  Map<String, dynamic> get asMap => toMap();

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'username': username});
    result.addAll({'password': password});

    return result;
  }

  @override
  String toString() =>
      'LoginCredentials(username: $username, password: $password)';
}
