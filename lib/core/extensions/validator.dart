extension EmailValidator on String {
  bool isValidEmail() {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);

    return regExp.hasMatch(this);
  }
}

extension PasswordValidator on String {
  bool isValidPassword() {
    String p = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(p);

    return regExp.hasMatch(this);
  }
}


// r'^
//  (?=.*[A-Z])       // should contain at least one upper case
//  (?=.*[a-z])       // should contain at least one lower case
//  (?=.*?[0-9])      // should contain at least one digit
//  (?=.*?[!@#\$&*~]) // should contain at least one Special character
//  .{8,}             // Must be at least 8 characters in length  
//$