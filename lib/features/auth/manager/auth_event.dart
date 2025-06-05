import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class AuthLogin extends AuthEvent {
  final String login;
  final String password;

  const AuthLogin({required this.login, required this.password});

  @override
  List<Object?> get props => [login, password];
}

class AuthRegister extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;
  // final String phoneNumber;
  // final String password;

  const AuthRegister({
    required this.firstName,
    required this.lastName,
    required this.email,
    // required this.phoneNumber,
    // required this.password,
  });

  @override
  List<Object?> get props => [firstName, lastName, email];
}
