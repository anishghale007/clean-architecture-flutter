part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class UserNameChangedEvent extends RegisterEvent {
  final String userName;

  const UserNameChangedEvent({required this.userName});

  @override
  List<Object> get props => [userName];
}

class EmailChangedEvent extends RegisterEvent {
  final String email;

  const EmailChangedEvent({required this.email});

  @override
  List<Object> get props => [email];
}

class PasswordChangedEvent extends RegisterEvent {
  final String password;

  const PasswordChangedEvent({required this.password});

  @override
  List<Object> get props => [password];
}

class RegisterUserEvent extends RegisterEvent {
  final String userName;
  final String email;
  final String password;

  const RegisterUserEvent(
      {required this.userName, required this.email, required this.password});

  @override
  List<Object> get props => [userName, email, password];
}
