part of 'registrar_bloc.dart';

abstract class RegistrarEvent extends Equatable {
  const RegistrarEvent();

  @override
  List<Object> get props => [];
}

class RegistrarNombreEvent extends RegistrarEvent {
  final String nombre;

  const RegistrarNombreEvent(this.nombre);
}

class RegistrarCorreoEvent extends RegistrarEvent {
  final String correo;

  const RegistrarCorreoEvent(this.correo);
}

class RegistrarPasswordEvent extends RegistrarEvent {
  final String password;

  const RegistrarPasswordEvent(this.password);
}

class ErrorRegistrarCorreoEvent extends RegistrarEvent {
  final String errorCorreo;

  const ErrorRegistrarCorreoEvent(this.errorCorreo);
}

class ErrorRegistrarUsuarioEvent extends RegistrarEvent {
  final String errorUsuario;

  const ErrorRegistrarUsuarioEvent(this.errorUsuario);
}

class ErrorRegistrarPasswordEvent extends RegistrarEvent {
  final String errorPassword;

  const ErrorRegistrarPasswordEvent(this.errorPassword);
}

class RegistrarMessageEvent extends RegistrarEvent {
  final String message;

  const RegistrarMessageEvent(this.message);
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
