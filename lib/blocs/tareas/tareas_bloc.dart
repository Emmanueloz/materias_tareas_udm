import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tareas_event.dart';
part 'tareas_state.dart';

class TareasBloc extends Bloc<TareasEvent, TareasState> {
  TareasBloc() : super(TareasInitial()) {
    on<TareasEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
