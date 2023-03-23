// password was incorrect
class IncorrectPasswordException implements Exception {
  String cause;
  IncorrectPasswordException(this.cause);
}

// credentials weren't valid
// like email not matching a certain regular expression
class InvalidCredentialsException implements Exception {
  String cause;
  InvalidCredentialsException(this.cause);
}

// user with email doesn't exist when logging in
class NonExistentUserException implements Exception {
  String cause;
  NonExistentUserException(this.cause);
}

// server not online
// turned off
class UnknownHostException implements Exception {
  String cause;
  UnknownHostException(this.cause);
}
