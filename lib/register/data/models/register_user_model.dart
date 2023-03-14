import 'package:v_commerce_vendor/register/domain/entities/register_user_entity.dart';

class RegisterUserModel extends RegisterUserEntity {
  const RegisterUserModel({
    required String userName,
    required String email,
    required String password,
  }) : super(
          userName: userName,
          email: email,
          password: password,
        );

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) =>
      RegisterUserModel(
        userName: json["userName"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "email": email,
        "password": password,
      };
}
