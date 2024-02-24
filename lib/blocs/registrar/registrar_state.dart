part of 'registrar_bloc.dart';

class RegistrarState extends Equatable {
  final String errorCorreo;
  final String errorUsuario;
  final String errorPassword;
  final String message;
  final String nombre;
  final String correo;
  final String password;
  const RegistrarState({
    required this.errorCorreo,
    required this.errorUsuario,
    required this.errorPassword,
    required this.message,
    required this.nombre,
    required this.correo,
    required this.password,
  });

  RegistrarState copyWith({
    String? errorCorreo,
    String? errorUsuario,
    String? errorPassword,
    String? message,
    String? nombre,
    String? correo,
    String? password,
  }) {
    return RegistrarState(
      errorCorreo: errorCorreo ?? this.errorCorreo,
      errorUsuario: errorUsuario ?? this.errorUsuario,
      errorPassword: errorPassword ?? this.errorPassword,
      message: message ?? this.message,
      nombre: nombre ?? this.nombre,
      correo: correo ?? this.correo,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [
        errorCorreo,
        errorUsuario,
        errorPassword,
        message,
        nombre,
        correo,
      ];
}

//final class RegistrarInitial extends RegistrarState {}
