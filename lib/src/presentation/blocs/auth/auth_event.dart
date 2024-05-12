part of 'auth_bloc.dart';

sealed class AuthEvent {
  factory AuthEvent.emailChangeEvent({required String value}) =>
      EmailChangedEvent(value);
  factory AuthEvent.passwordChangeEvent({required String value}) =>
      PasswordChangedEvent(value);
  factory AuthEvent.cleanFields() => ClearFields();
  factory AuthEvent.signIn() => SignIn();
  factory AuthEvent.signUp() => SignUp();
  factory AuthEvent.signInGoogle() => SignInGoogle();
  // factory AuthEvent.signUpGoogle() => SignUpGoogle();
  factory AuthEvent.checkSesion() => CheckSesion();
  factory AuthEvent.logout() => Logout();
}

class EmailChangedEvent implements AuthEvent {
  final String value;

  EmailChangedEvent(this.value);
}

class PasswordChangedEvent implements AuthEvent {
  final String value;

  PasswordChangedEvent(this.value);
}

class ClearFields implements AuthEvent {}

class CheckSesion implements AuthEvent {}

class SignIn implements AuthEvent {}

class SignUp implements AuthEvent {}

class SignInGoogle implements AuthEvent {}

// class SignUpGoogle implements AuthEvent {}

class Logout implements AuthEvent {}
