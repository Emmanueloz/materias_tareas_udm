part of 'tareas_bloc.dart';

abstract class TareasEvent extends Equatable {
  const TareasEvent();

  @override
  List<Object> get props => [];
}

class TareasNombreEvent extends TareasEvent {
  final String nombre;
  const TareasNombreEvent(this.nombre);
}

class TareasMateriaEvent extends TareasEvent {
  final String materia;
  const TareasMateriaEvent(this.materia);
}

class TareasAddEvent extends TareasEvent {
  final Tareas tarea;
  const TareasAddEvent(this.tarea);
}

class TareasDeleteEvent extends TareasEvent {
  final Tareas tarea;
  const TareasDeleteEvent(this.tarea);
}

class TareasClearEvent extends TareasEvent {
  const TareasClearEvent();
}
