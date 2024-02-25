import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'usuarios_event.dart';
part 'usuarios_state.dart';

class UsuariosBloc extends Bloc<UsuariosEvent, UsuariosState> {
  UsuariosBloc()
      : super(const UsuariosState(
          nombre: '',
          correo: '',
        )) {
    on<UsuarioNombreEvent>((event, emit) {
      emit(state.copyWith(nombre: event.nombre));
    });
    on<UsuarioCorreoEvent>((event, emit) {
      emit(state.copyWith(correo: event.correo));
    });
    on<UsuarioLimpiarEvent>((event, emit) {
      emit(state.cleanState());
    });
  }
}
