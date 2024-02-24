class Validate {
  static bool isName(String name) {
    String pattern = r"\d+";
    RegExp regExp = RegExp(pattern);
    return !regExp.hasMatch(name);
  }

  static bool isEmail(String email) {
    String pattern =
        r'^[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*@[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  static bool isPassword(String password) {
    return password.length >= 4;
  }
}
