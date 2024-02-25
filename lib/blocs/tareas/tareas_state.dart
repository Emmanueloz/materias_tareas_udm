part of 'tareas_bloc.dart';

class TareasState extends Equatable {
  final String nombre;
  final String materia;
  final List<Tareas> ltsTareas;
  const TareasState({
    required this.nombre,
    required this.materia,
    required this.ltsTareas,
  });

  TareasState copyWith({String? nombre, String? materia, Tareas? tarea}) {
    return TareasState(
      nombre: nombre ?? this.nombre,
      materia: materia ?? this.materia,
      ltsTareas: tarea == null ? ltsTareas : [...ltsTareas, tarea],
    );
  }

  TareasState removeTarea(Tareas tarea) {
    ltsTareas.remove(tarea);
    return TareasState(
      nombre: nombre,
      materia: materia,
      ltsTareas: ltsTareas,
    );
  }

  TareasState clearTarea() {
    return TareasState(
      nombre: nombre,
      materia: materia,
      ltsTareas: const [],
    );
  }

  @override
  List<Object> get props => [nombre, materia, ltsTareas];
}
