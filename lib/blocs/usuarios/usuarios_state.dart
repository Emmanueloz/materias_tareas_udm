part of 'usuarios_bloc.dart';

class UsuariosState extends Equatable {
  final String nombre;
  final String correo;
  const UsuariosState({
    required this.nombre,
    required this.correo,
  });

  UsuariosState copyWith({
    String? nombre,
    String? correo,
  }) {
    return UsuariosState(
      nombre: nombre ?? this.nombre,
      correo: correo ?? this.correo,
    );
  }

  UsuariosState cleanState() {
    return const UsuariosState(
      nombre: '',
      correo: '',
    );
  }

  @override
  List<Object> get props => [nombre, correo];
}
