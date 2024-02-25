import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(
          const LoginState(
            correo: '',
            password: '',
            errorCorreo: '',
            errorPassword: '',
            message: '',
          ),
        ) {
    on<LoginCorreoEvent>(
      (event, emit) => emit(
        state.copyWith(correo: event.correo),
      ),
    );

    on<LoginPasswordEvent>(
      (event, emit) => emit(
        state.copyWith(password: event.password),
      ),
    );

    on<LoginErrorCorreoEvent>(
      (event, emit) => emit(
        state.copyWith(errorCorreo: event.errorCorreo),
      ),
    );

    on<LoginErrorPasswordEvent>(
      (event, emit) => emit(
        state.copyWith(errorPassword: event.errorPassword),
      ),
    );

    on<LoginValidarCorreoEvent>(
      (event, emit) => emit(
        state.copyWith(errorCorreo: ""),
      ),
    );

    on<LoginValidarPasswordEvent>(
      (event, emit) => emit(
        state.copyWith(errorPassword: ""),
      ),
    );

    on<LoginMessageEvent>(
      (event, emit) => emit(
        state.copyWith(message: event.message),
      ),
    );

    on<LoginResetEvent>(
      (event, emit) => emit(
        state.reset(),
      ),
    );
  }
}
