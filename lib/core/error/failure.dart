import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

//General Failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

//text field failures
class EmptyFieldFailure extends Failure {}

class InvalidInputFailure extends Failure {}
