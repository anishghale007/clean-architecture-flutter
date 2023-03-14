import 'package:equatable/equatable.dart';
import 'package:v_commerce_vendor/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:v_commerce_vendor/core/usecases/usecase.dart';
import 'package:v_commerce_vendor/register/domain/entities/register_user_entity.dart';
import 'package:v_commerce_vendor/register/domain/repositories/register_user_repository.dart';

class RegisterNewUser implements UseCase<RegisterUserEntity, Params> {
  final RegisterUserRepository registerUserRepository;

  RegisterNewUser({
    required this.registerUserRepository,
  });

  @override
  Future<Either<Failure, RegisterUserEntity>> call(Params params) async {
    return await registerUserRepository.registerNewUser(
      userName: params.userName,
      email: params.email,
      password: params.password,
    );
  }
}

class Params extends Equatable {
  final String userName;
  final String email;
  final String password;

  const Params({
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
