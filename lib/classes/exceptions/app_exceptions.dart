class IncorrectPasswordException implements Exception {
  String cause;
  IncorrectPasswordException(this.cause);
}

class InvalidCredentialsException implements Exception {
  String cause;
  InvalidCredentialsException(this.cause);
}

class NonExistentUserException implements Exception {
  String cause;
  NonExistentUserException(this.cause);
}

class UnknownHostException implements Exception {
  String cause;
  UnknownHostException(this.cause);
}
