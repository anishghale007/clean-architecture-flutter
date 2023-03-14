import 'package:equatable/equatable.dart';

class RegisterUserEntity extends Equatable {
  final String userName;
  final String email;
  final String password;

  const RegisterUserEntity({
    required this.userName,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        userName,
        email,
        password,
      ];
}
