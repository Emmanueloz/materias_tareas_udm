import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:materias_tareas_udm/models/materias.dart';

part 'materias_event.dart';
part 'materias_state.dart';

class MateriasBloc extends Bloc<MateriasEvent, MateriasState> {
  MateriasBloc()
      : super(
          const MateriasState(
            nombre: '',
            ltsMaterias: [],
          ),
        ) {
    on<MateriasNombreEvent>(
      (event, emit) => emit(
        state.copyWith(nombre: event.nombre),
      ),
    );

    on<MateriasAddEvent>(
      (event, emit) => emit(
        state.copyWith(materia: event.materia),
      ),
    );

    on<MateriasDeleteEvent>(
      (event, emit) => emit(
        state.removeMateria(event.materia),
      ),
    );

    on<MateriasClearEvent>(
      (event, emit) => emit(
        state.clearMateria(),
      ),
    );
  }
}
