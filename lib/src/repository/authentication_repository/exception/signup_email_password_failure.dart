class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An Unknown error occured!"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case '':
        return const SignUpWithEmailAndPasswordFailure('');

      case 'weak password':
        return const SignUpWithEmailAndPasswordFailure(
            'Please Enter a strong password!');

      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
            'Please Enter a well formatted e-mail!');

      case 'email already in-use':
        return const SignUpWithEmailAndPasswordFailure(
            'Account Already exists for that e-mail!');

      case 'operation bot allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'Operation Not Allowed. Please contact Admin for Support!');

      case 'user disabled':
        return const SignUpWithEmailAndPasswordFailure(
            'User Account has been disabled. Please contact Admin for Support!');

      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
