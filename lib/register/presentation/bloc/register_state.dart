part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterLoaded extends RegisterState {
  final RegisterUserEntity registerUserEntity;

  const RegisterLoaded({required this.registerUserEntity});

  @override
  List<Object> get props => [
        registerUserEntity,
      ];
}

class RegisterError extends RegisterState {
  final String errorMessage;

  const RegisterError({required this.errorMessage});

  @override
  List<Object> get props => [
        errorMessage,
      ];
}

// username state
class RegisterValidUsername extends RegisterState {
  final bool validUsername;

  const RegisterValidUsername({required this.validUsername});

  @override
  List<Object> get props => [
        validUsername,
      ];
}

class RegisterInvalidUsername extends RegisterState {
  final String invalidUsername;

  const RegisterInvalidUsername({required this.invalidUsername});

  @override
  List<Object> get props => [
        invalidUsername,
      ];
}

// email state

class RegisterValidEmail extends RegisterState {
  final bool validEmail;

  const RegisterValidEmail({required this.validEmail});

  @override
  List<Object> get props => [
        validEmail,
      ];
}

class RegisterInvalidEmail extends RegisterState {
  final String invalidEmail;

  const RegisterInvalidEmail({required this.invalidEmail});

  @override
  List<Object> get props => [
        invalidEmail,
      ];
}

//password state
class RegisterValidPassword extends RegisterState {
  final bool validPassword;

  const RegisterValidPassword({required this.validPassword});

  @override
  List<Object> get props => [
        validPassword,
      ];
}

class RegisterInvalidPassword extends RegisterState {
  final String invalidPassword;

  const RegisterInvalidPassword({required this.invalidPassword});

  @override
  List<Object> get props => [
        invalidPassword,
      ];
}

