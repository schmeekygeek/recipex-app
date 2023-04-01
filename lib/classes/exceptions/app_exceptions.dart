// password was incorrect
class IncorrectPasswordException implements Exception {
  String cause;
  IncorrectPasswordException(this.cause);
}

// invalid password (min 8 characters)
class InvalidPasswordException implements Exception {
  InvalidPasswordException();
}

// invalid email (regex)
class InvalidEmailException implements Exception {
  InvalidEmailException();
}

// (minimum 2 characters and max 20 characters, regex)
class InvalidUsernameException implements Exception {
  InvalidUsernameException();
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

// username already taken
class UsernameTakenException implements Exception {
  String cause;
  UsernameTakenException(this.cause);
  
}

// email already taken exception
class EmailTakenException implements Exception {
  String cause;
  EmailTakenException(this.cause);
}
