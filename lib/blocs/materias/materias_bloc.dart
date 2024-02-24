import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'materias_event.dart';
part 'materias_state.dart';

class MateriasBloc extends Bloc<MateriasEvent, MateriasState> {
  MateriasBloc() : super(MateriasInitial()) {
    on<MateriasEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
