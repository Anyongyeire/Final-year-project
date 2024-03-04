class TExceptions implements Exception {
  final String message;

  const TExceptions([this.message = "An Unknown error occured!"]);

  factory TExceptions.fromCode(String code) {
    switch (code) {
      case '':
        return const TExceptions('');

      case 'weak-password':
        return const TExceptions('Please Enter a strong password!');

      case 'invalid-email':
        return const TExceptions('Please Enter a well formatted e-mail!');

      case 'email-already-in-use':
        return const TExceptions('Account Already exists for that e-mail!');

      case 'operation-not-allowed':
        return const TExceptions(
            'Operation Not Allowed. Please contact Admin for Support!');

      case 'user-not-found':
        return const TExceptions('Invalid Deatails! Create an account.');

      case 'wrong-password':
        return const TExceptions('Incorrect Password, Try again!');

      case 'too-many-requests':
        return const TExceptions(
            'Too Many requests, Service temporarily blocked!');

      case 'invalid-argument':
        return const TExceptions(
            'An invalid argument was provided to an Authentication method');

      case 'invalid-password':
        return const TExceptions('Incorrect Password, Try again');

      case 'invalid-Phone-Number':
        return const TExceptions('phone number provided is invalid!');

      case 'Operation-not-allowed':
        return const TExceptions(
            'The provided signin provider is disabled for your firebase project');

      case 'session-cookie-expired':
        return const TExceptions('The provided session cookie is expired!');

      case 'uid-already-exists':
        return const TExceptions(
            'The provided uid is already in use by an existing user!');
      default:
        return const TExceptions();
    }
  }
}
