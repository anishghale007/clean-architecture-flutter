import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:v_commerce_vendor/constants.dart';
import 'package:v_commerce_vendor/core/util/text_validator.dart';
import 'package:v_commerce_vendor/register/domain/entities/register_user_entity.dart';
import 'package:v_commerce_vendor/register/domain/usecases/register_new_user.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterNewUser registerNewUser;
  final TextValidator textValidator;
  RegisterBloc({required this.textValidator, required this.registerNewUser})
      : super(RegisterInitial()) {
    on<UserNameChangedEvent>(_onUserNameChanged);
    on<EmailChangedEvent>(_onEmailChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);
    on<RegisterUserEvent>(_onNewUserRegistered);
  }
  FutureOr<void> _onUserNameChanged(
      UserNameChangedEvent event, Emitter<RegisterState> emit) {
    final userName = textValidator.inputUserNameChecker(event.userName);
    userName.fold(
      (failure) => emit(
        const RegisterInvalidUsername(
          invalidUsername: "Invalid username",
        ),
      ),
      (value) => emit(
        RegisterValidUsername(validUsername: value),
      ),
    );
  }

  FutureOr<void> _onEmailChanged(
      EmailChangedEvent event, Emitter<RegisterState> emit) {
    final email = textValidator.inputEmailChecker(event.email);
    emit(RegisterLoading());
    email.fold(
      (failure) => emit(
        const RegisterInvalidEmail(
          invalidEmail: "Invalid email",
        ),
      ),
      (value) => emit(
        RegisterValidEmail(validEmail: value),
      ),
    );
  }

  FutureOr<void> _onPasswordChanged(
      PasswordChangedEvent event, Emitter<RegisterState> emit) {
    final password = textValidator.inputPasswordChecker(event.password);
    password.fold(
      (failure) => emit(
          const RegisterInvalidPassword(invalidPassword: "Invalid password")),
      (value) => emit(
        RegisterValidPassword(validPassword: value),
      ),
    );
  }

  Future<void> _onNewUserRegistered(
      RegisterUserEvent event, Emitter<RegisterState> emit) async {
    final registerUser = await registerNewUser(
      Params(
        userName: event.userName,
        email: event.email,
        password: event.password,
      ),
    );

    emit(RegisterLoading());
    await Future.delayed(const Duration(seconds: 5));

    registerUser.fold(
      (failure) => emit(
        const RegisterError(errorMessage: serverFailureMessage),
      ),
      (registerUserEntity) {
        emit(
          RegisterLoaded(
            registerUserEntity: registerUserEntity,
          ),
        );
      },
    );
  }
}
