import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:v_commerce_vendor/core/error/failure.dart';
import 'package:v_commerce_vendor/core/extensions/validator.dart';

class TextValidator {
 Either<Failure, bool> inputUserNameChecker(String userName) {
    try {
      if (userName.isNotEmpty) {
        return right(true);
      } else {
        return left(EmptyFieldFailure());
      }
    } catch (e) {
      log("text input failure ${e.toString()}");
      return left(InvalidInputFailure());
    }
  }

  Either<Failure, bool> inputEmailChecker(String email) {
    try {
      if (email.isNotEmpty && email.isValidEmail()) {
        return right(true);
      } else {
        return left(EmptyFieldFailure());
      }
    } catch (e) {
      log("text input failure ${e.toString()}");
      return left(InvalidInputFailure());
    }
  }
   Either<Failure, bool> inputPasswordChecker(String password) {
    try {
      if (password.isNotEmpty && password.isValidPassword()) {
        return right(true);
      } else {
        return left(InvalidInputFailure());
      }
    } catch (e) {
      log("text input failure ${e.toString()}");
      return left(InvalidInputFailure());
    }
  }
}
