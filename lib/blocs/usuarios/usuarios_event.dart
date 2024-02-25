part of 'usuarios_bloc.dart';

abstract class UsuariosEvent extends Equatable {
  const UsuariosEvent();

  @override
  List<Object> get props => [];
}

class UsuarioNombreEvent extends UsuariosEvent {
  final String nombre;
  const UsuarioNombreEvent(this.nombre);
}

class UsuarioCorreoEvent extends UsuariosEvent {
  final String correo;
  const UsuarioCorreoEvent(this.correo);
}

class UsuarioLimpiarEvent extends UsuariosEvent {
  const UsuarioLimpiarEvent();
}
