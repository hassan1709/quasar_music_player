class AuthenticationException implements Exception {
  final String message;

  AuthenticationException(this.message);

  @override
  String toString() {
    return message;
  }

  static Exception userNotFound() {
    throw AuthenticationException(
        'User not found in the system. Please enter correct details.');
  }

  static Exception userNotConfirmed() {
    throw AuthenticationException(
        'User not confirmed. Please check the confirmation code in your email.');
  }

  static Exception invalidParameters() {
    throw AuthenticationException(
        'Email or password incorrect. Please enter correct email and password');
  }

  static Exception invalidPasswordException() {
    throw AuthenticationException(
        'The password given is not valid. Please enter a valid password. At least 8 characters including uppercase and lowercase.');
  }
}
