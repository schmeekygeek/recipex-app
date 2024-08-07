import '../classes/exceptions/app_exceptions.dart';

class Validator {

  static final RegExp validUsernameRegex = 
    RegExp(
      r'^[a-zA-Z0-9]+([_-]?[a-zA-Z0-9])$',
      caseSensitive: false,
      multiLine: true,
      unicode: true,
    );

  static final RegExp validPasswordRegex = 
    RegExp(
    '[\\s\\S]{2,}',
     caseSensitive: false,
     multiLine: true,
     unicode: true,
  );

  static final RegExp validEmailRegex =
    RegExp("^[a-zA-Z0-9_!#\$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+\$");

  static final RegExp validNameRegex = RegExp(
    r"^[\p{L} ,.'-]*$",
      caseSensitive: false,
      multiLine: true,
      unicode: true,
  );

  static void validatePassword(String password) {
    if(!validPasswordRegex.hasMatch(password)) {
      throw InvalidPasswordException(
        'The password must be atleast 2 characters long'
      );
    }
  }

  static void validateUsername(String username) {
    if(!validUsernameRegex.hasMatch(username)) {
      throw InvalidUsernameException(
        'The username is not valid'
      );
    }
  }

  static void validateEmail(String email) {
    if(!validEmailRegex.hasMatch(email)) {
      throw InvalidEmailException(
        'The email is not valid'
      );
    }
  }

  static void validateName(String name) {
    if(!validNameRegex.hasMatch(name)) {
      throw InvalidNameException(
        'The name is not valid'
      );
    }
  }
}
