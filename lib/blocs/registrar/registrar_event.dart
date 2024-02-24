part of 'registrar_bloc.dart';

abstract class RegistrarEvent extends Equatable {
  const RegistrarEvent();

  @override
  List<Object> get props => [];
}

class RegistrarNombreEvent extends RegistrarEvent {
  final String nombre;

  const RegistrarNombreEvent({required this.nombre});
}

class RegistrarCorreoEvent extends RegistrarEvent {
  final String correo;

  const RegistrarCorreoEvent({required this.correo});
}

class RegistrarPasswordEvent extends RegistrarEvent {
  final String password;

  const RegistrarPasswordEvent({required this.password});
}

class ErrorRegistrarCorreoEvent extends RegistrarEvent {
  final String errorCorreo;

  const ErrorRegistrarCorreoEvent({required this.errorCorreo});
}

class ErrorRegistrarUsuarioEvent extends RegistrarEvent {
  final String errorUsuario;

  const ErrorRegistrarUsuarioEvent({required this.errorUsuario});
}

class ErrorRegistrarPasswordEvent extends RegistrarEvent {
  final String errorPassword;

  const ErrorRegistrarPasswordEvent({required this.errorPassword});
}

class RegistrarMessageEvent extends RegistrarEvent {
  final String message;

  const RegistrarMessageEvent({required this.message});
}

class ValidarUsuarioEvent extends RegistrarEvent {
  const ValidarUsuarioEvent();
}

class ValidarCorreoEvent extends RegistrarEvent {
  const ValidarCorreoEvent();
}

class ValidarPasswordEvent extends RegistrarEvent {
  const ValidarPasswordEvent();
}
