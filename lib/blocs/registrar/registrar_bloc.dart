import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'registrar_event.dart';
part 'registrar_state.dart';

class RegistrarBloc extends Bloc<RegistrarEvent, RegistrarState> {
  RegistrarBloc()
      : super(const RegistrarState(
          errorCorreo: '',
          errorUsuario: '',
          errorPassword: '',
          message: '',
          nombre: '',
          correo: '',
          password: '',
        )) {
    on<RegistrarNombreEvent>(
      (event, emit) => emit(
        state.copyWith(nombre: event.nombre),
      ),
    );

    on<RegistrarCorreoEvent>(
      (event, emit) => emit(
        state.copyWith(correo: event.correo),
      ),
    );

    on<RegistrarPasswordEvent>(
      (event, emit) => emit(
        state.copyWith(password: event.password),
      ),
    );

    on<ErrorRegistrarCorreoEvent>(
      (event, emit) => emit(
        state.copyWith(errorCorreo: event.errorCorreo),
      ),
    );

    on<ErrorRegistrarUsuarioEvent>(
      (event, emit) => emit(
        state.copyWith(errorUsuario: event.errorUsuario),
      ),
    );

    on<ErrorRegistrarPasswordEvent>(
      (event, emit) => emit(
        state.copyWith(errorPassword: event.errorPassword),
      ),
    );

    on<RegistrarMessageEvent>(
      (event, emit) => emit(
        state.copyWith(message: event.message),
      ),
    );

    on<ValidarUsuarioEvent>(
      (event, emit) => emit(
        state.copyWith(errorUsuario: ""),
      ),
    );

    on<ValidarCorreoEvent>(
      (event, emit) => emit(
        state.copyWith(errorCorreo: ""),
      ),
    );

    on<ValidarPasswordEvent>(
      (event, emit) => emit(
        state.copyWith(errorPassword: ""),
      ),
    );

    on<RegistrarResetEvent>(
      (event, emit) => emit(
        state.reset(),
      ),
    );
  }
}
