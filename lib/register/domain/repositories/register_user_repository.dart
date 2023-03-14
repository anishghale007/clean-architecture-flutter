import 'package:dartz/dartz.dart';
import 'package:v_commerce_vendor/core/error/failure.dart';
import 'package:v_commerce_vendor/register/domain/entities/register_user_entity.dart';

abstract class RegisterUserRepository {
  Future<Either<Failure, RegisterUserEntity>> registerNewUser({
    required userName,
    required email,
    required password,
  });
}
