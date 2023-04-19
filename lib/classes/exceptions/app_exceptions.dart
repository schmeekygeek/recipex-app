// password was incorrect
class IncorrectPasswordException implements Exception {
  String cause;
  IncorrectPasswordException(this.cause);
}

// invalid password (min 8 characters)
class InvalidPasswordException implements Exception {
  String cause;
  InvalidPasswordException(this.cause);
}

// invalid name (min 2 characters)
class InvalidNameException implements Exception {
  String cause;
  InvalidNameException(this.cause);
}

// invalid email (regex)
class InvalidEmailException implements Exception {
  String cause;
  InvalidEmailException(this.cause);
}

// (minimum 2 characters and max 20 characters, regex)
class InvalidUsernameException implements Exception {
  String cause;
  InvalidUsernameException(this.cause);
}

// user with email or username doesn't exist when logging in
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

// Username already taken
class UsernameTakenException implements Exception {
  UsernameTakenException();
}

// Email already taken
class EmailTakenException implements Exception {
  EmailTakenException();
}
