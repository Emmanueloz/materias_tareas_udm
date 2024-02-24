import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'registrar_event.dart';
part 'registrar_state.dart';

class RegistrarBloc extends Bloc<RegistrarEvent, RegistrarState> {
  RegistrarBloc() : super(RegistrarInitial()) {
    on<RegistrarEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
