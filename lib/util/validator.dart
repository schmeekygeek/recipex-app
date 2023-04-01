import 'package:recipex_app/classes/exceptions/app_exceptions.dart';

class Validator {

  static final RegExp validUsernameRegex = 
    RegExp("^(?=.{2,20}\$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])\$");

  static void validatePassword(String password) {

    final RegExp validPasswordRegex = 
      RegExp("[\\s\\S]{8,}");

    if(!validPasswordRegex.hasMatch(password)) {
      throw InvalidPasswordException();
    }
  }

  static void validateUsername(String username) {

  final RegExp validUsernameRegex = 
    RegExp("^(?=.{2,20}\$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])\$");

    if(!validUsernameRegex.hasMatch(username)) {
      throw InvalidUsernameException();
    }
  }

  static void validateEmail(String email) {

    final RegExp validEmailRegex = 
      RegExp("[\\s\\S]{8,}");

    if(!validEmailRegex.hasMatch(email)) {
      throw InvalidEmailException();
    }
  }
}
