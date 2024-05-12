part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, success, error, closed }

enum FormStatus { invalid, valid, validating, posting }

class AuthState extends Equatable {
  final Email email;
  final Password password;
  final AuthStatus status;
  final UserEntity? user;
  final bool isValid;
  final FormStatus formStatus;
  final bool isLoged;
  final String errorText;
  const AuthState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.user,
    this.status = AuthStatus.initial,
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
    this.isLoged = false,
    this.errorText = "",
  });

  factory AuthState.initState() => const AuthState();

  AuthState copyWith({
    UserEntity? user,
    Email? email,
    Password? password,
    AuthStatus? status,
    FormStatus? formStatus,
    bool? isValid,
    bool? isLoged,
    String? errorText,
  }) =>
      AuthState(
        errorText: errorText ?? this.errorText,
        user: user ?? this.user,
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        formStatus: formStatus ?? this.formStatus,
        isValid: isValid ?? this.isValid,
        isLoged: isLoged ?? this.isLoged,
      );

  @override
  List<Object?> get props =>
      [user, email, password, status, formStatus, isValid, isLoged, errorText];
}
