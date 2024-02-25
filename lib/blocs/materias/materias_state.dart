part of 'materias_bloc.dart';

class MateriasState extends Equatable {
  final String nombre;
  final List<Materias> ltsMaterias;
  const MateriasState({required this.nombre, required this.ltsMaterias});

  MateriasState copyWith({String? nombre, Materias? materia}) {
    return MateriasState(
      nombre: nombre ?? this.nombre,
      ltsMaterias: materia == null ? ltsMaterias : [...ltsMaterias, materia],
    );
  }

  MateriasState clearMateria() {
    return const MateriasState(
      nombre: "",
      ltsMaterias: [],
    );
  }

  @override
  List<Object> get props => [nombre, ltsMaterias];
}
