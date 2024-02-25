part of 'materias_bloc.dart';

abstract class MateriasEvent extends Equatable {
  const MateriasEvent();

  @override
  List<Object> get props => [];
}

class MateriasNombreEvent extends MateriasEvent {
  final String nombre;
  const MateriasNombreEvent(this.nombre);
}

class MateriasAddEvent extends MateriasEvent {
  final Materias materia;
  const MateriasAddEvent(this.materia);
}

class MateriasClearEvent extends MateriasEvent {
  const MateriasClearEvent();
}
