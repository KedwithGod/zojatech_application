bool isValidPassword(String value) {
  String pattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,}$';
  RegExp regExp =  RegExp(pattern);
  return regExp.hasMatch(value);
}