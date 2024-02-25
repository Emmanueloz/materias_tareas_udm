import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:materias_tareas_udm/models/tareas.dart';

part 'tareas_event.dart';
part 'tareas_state.dart';

class TareasBloc extends Bloc<TareasEvent, TareasState> {
  TareasBloc()
      : super(const TareasState(
          nombre: '',
          materia: '',
          ltsTareas: [],
        )) {
    on<TareasNombreEvent>(
      (event, emit) => emit(
        state.copyWith(nombre: event.nombre),
      ),
    );

    on<TareasMateriaEvent>(
      (event, emit) => emit(
        state.copyWith(materia: event.materia),
      ),
    );

    on<TareasAddEvent>(
      (event, emit) => emit(
        state.copyWith(tarea: event.tarea),
      ),
    );

    on<TareasDeleteEvent>(
      (event, emit) => emit(
        state.removeTarea(event.tarea),
      ),
    );

    on<TareasClearEvent>(
      (event, emit) => emit(
        state.clearTarea(),
      ),
    );
  }
}
