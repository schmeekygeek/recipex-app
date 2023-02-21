class Constants {

  static final RegExp validPasswordRegex = 
    RegExp("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#\$%^&+=])(?=\\S+\$).{8,}\$");

  static final RegExp validUsernameRegex = 
    RegExp("^(?=.{5,12}\$)(?!.*[._-]{2})[a-z][a-z0-9._-]*[a-z0-9]\$");

}
