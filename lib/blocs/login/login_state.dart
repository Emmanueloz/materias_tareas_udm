part of 'login_bloc.dart';

class LoginState extends Equatable {
  final String correo;
  final String password;
  final String errorCorreo;
  final String errorPassword;
  final String message;
  const LoginState({
    required this.correo,
    required this.password,
    required this.errorCorreo,
    required this.errorPassword,
    required this.message,
  });

  LoginState copyWith({
    String? correo,
    String? password,
    String? errorCorreo,
    String? errorPassword,
    String? message,
  }) {
    return LoginState(
      correo: correo ?? this.correo,
      password: password ?? this.password,
      errorCorreo: errorCorreo ?? this.errorCorreo,
      errorPassword: errorPassword ?? this.errorPassword,
      message: message ?? this.message,
    );
  }

  LoginState reset() {
    return const LoginState(
      correo: '',
      password: '',
      errorCorreo: '',
      errorPassword: '',
      message: '',
    );
  }

  @override
  List<Object> get props => [
        correo,
        password,
        errorCorreo,
        errorPassword,
        message,
      ];
}
