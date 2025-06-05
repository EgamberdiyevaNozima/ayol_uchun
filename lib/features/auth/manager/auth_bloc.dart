import 'dart:developer';

import 'package:ayol_uchun_project/data/repository/auth_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<AuthLogin>(_onLoginRequested);
    on<AuthRegister>(_onSignUpRequested);
  }

  Future<void> _onLoginRequested(
      AuthLogin event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());
    try {
      final success = await repository.login(event.login, event.password);
      if (success) {
        emit(AuthSuccess());
      } else {
        emit(const AuthFailure('Login failed'));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onSignUpRequested(
      AuthRegister event,
      Emitter<AuthState> emit,
      ) async {
    log("error in register 1");
    emit(AuthLoading());
    log("error in register 2");

    try {
      final success = await repository.signUp(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        // phoneNumber: event.phoneNumber,
        // password: event.password,
      );
      if (success) {
        log("success in register");
        emit(AuthSuccess());
      } else {
        log("error in register");
        emit(const AuthFailure('Registration failed'));
      }
    } catch (e) {
      log("error failure in register");
      emit(AuthFailure(e.toString()));
    }
  }
}
