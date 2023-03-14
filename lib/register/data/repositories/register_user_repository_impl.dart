import 'dart:developer';

import 'package:v_commerce_vendor/core/error/exceptions.dart';
import 'package:v_commerce_vendor/register/data/datasources/register_user_datasoure.dart';
import 'package:v_commerce_vendor/register/domain/entities/register_user_entity.dart';
import 'package:v_commerce_vendor/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:v_commerce_vendor/register/domain/repositories/register_user_repository.dart';

class RegisterUserRepositoryImpl extends RegisterUserRepository {
  final RegisterUserDatasource registerUserDataSource;

  RegisterUserRepositoryImpl({required this.registerUserDataSource});

  @override
  Future<Either<Failure, RegisterUserEntity>> registerNewUser({
    required userName,
    required email,
    required password,
  }) async {
    try {
      final registerData = await registerUserDataSource.registerNewUser(
        userName: userName,
        email: email,
        password: password,
      );
      return Right(registerData);
    } on ServerException {
      return left(ServerFailure());
    }
  }
}
