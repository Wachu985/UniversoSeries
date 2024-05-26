import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  AuthBloc({required this.repository}) : super(AuthState.initState()) {
    on<EmailChangedEvent>(_emailChangeEvent);
    on<PasswordChangedEvent>(_passwordChangeEvent);
    on<SignIn>(_signIn);
    on<SignInGoogle>(_signInGoogle);
    on<SignUp>(_signUp);
    on<ClearFields>(_cleanFields);
    on<CheckSesion>(_checkSesion);
    on<Logout>(_logOut);
  }

  FutureOr<void> _emailChangeEvent(
      EmailChangedEvent event, Emitter<AuthState> emit) {
    final email = Email.dirty(event.value);
    emit(state.copyWith(
        email: email, isValid: Formz.validate([email, state.password])));
  }

  FutureOr<void> _passwordChangeEvent(
      PasswordChangedEvent event, Emitter<AuthState> emit) {
    final password = Password.dirty(event.value);
    emit(state.copyWith(
        password: password, isValid: Formz.validate([state.email, password])));
  }

  FutureOr<void> _signIn(SignIn event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
        formStatus: FormStatus.validating,
        password: Password.dirty(state.password.value),
        email: Email.dirty(state.email.value),
        isValid: Formz.validate([state.email, state.password])));
    if (state.isValid) {
      emit(state.copyWith(status: AuthStatus.loading));
      try {
        final response = await repository.loginWithEmail(
            email: state.email.value, password: state.password.value);
        emit(state.copyWith(
            status: AuthStatus.success, user: response, isLoged: true));
        await Future.delayed(const Duration(seconds: 1));
        emit(state.copyWith(status: AuthStatus.initial));
      } on AuthException catch (authException) {
        emit(state.copyWith(
          status: AuthStatus.error,
          isLoged: false,
          errorText: authException.message,
        ));
        await Future.delayed(const Duration(seconds: 1));
        emit(state.copyWith(status: AuthStatus.initial));
      } catch (e) {
        emit(
          state.copyWith(
            status: AuthStatus.error,
            isLoged: false,
            errorText: e.toString(),
          ),
        );
        await Future.delayed(const Duration(seconds: 1));
        emit(state.copyWith(status: AuthStatus.initial));
      }

      // print('Submit $state');
    }
  }

  FutureOr<void> _signUp(SignUp event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
        formStatus: FormStatus.validating,
        password: Password.dirty(state.password.value),
        email: Email.dirty(state.email.value),
        isValid: Formz.validate([state.email, state.password])));
    if (state.isValid) {
      emit(state.copyWith(status: AuthStatus.loading));
      try {
        await repository.registerWithEmail(
            email: state.email.value, password: state.password.value);
        emit(state.copyWith(status: AuthStatus.success, isLoged: false));
        await Future.delayed(const Duration(seconds: 1));
        emit(state.copyWith(status: AuthStatus.initial));
      } on AuthException catch (authException) {
        emit(state.copyWith(
          status: AuthStatus.error,
          isLoged: false,
          errorText: authException.message,
        ));
        await Future.delayed(const Duration(seconds: 1));
        emit(state.copyWith(status: AuthStatus.initial));
      } catch (e) {
        emit(state.copyWith(
          status: AuthStatus.error,
          isLoged: false,
          errorText: e.toString(),
        ));
        await Future.delayed(const Duration(seconds: 1));
        emit(state.copyWith(status: AuthStatus.initial));
      }

      // print('Submit $state');
    }
  }

  FutureOr<void> _cleanFields(ClearFields event, Emitter<AuthState> emit) {}

  FutureOr<void> _checkSesion(
      CheckSesion event, Emitter<AuthState> emit) async {
    try {
      final response = await repository.checkSesion();
      if (response != null) {
        emit(state.copyWith(
            status: AuthStatus.success, user: response, isLoged: true));
        emit(state.copyWith(status: AuthStatus.initial));
      } else {
        emit(state.copyWith(status: AuthStatus.success, isLoged: false));
        await Future.delayed(const Duration(seconds: 1));
        emit(state.copyWith(status: AuthStatus.initial));
      }
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        isLoged: false,
        errorText: e.toString(),
      ));
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: AuthStatus.initial));
    }
  }

  FutureOr<void> _logOut(Logout event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    await repository.logout();
    emit(state.copyWith(status: AuthStatus.closed, isLoged: false));
  }

  FutureOr<void> _signInGoogle(
      SignInGoogle event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final response = await repository.loginWithGoogle();
      emit(state.copyWith(
          status: AuthStatus.success, user: response, isLoged: true));
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: AuthStatus.initial));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        isLoged: false,
        errorText: e.toString(),
      ));
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(status: AuthStatus.initial));
    }
  }
}
