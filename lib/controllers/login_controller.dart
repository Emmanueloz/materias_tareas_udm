import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materias_tareas_udm/blocs/login/login_bloc.dart';
import 'package:materias_tareas_udm/utils/validador.dart';

class LoginController {
  final BuildContext context;
  late final LoginBloc loginBloc;

  LoginController({required this.context}) {
    loginBloc = BlocProvider.of<LoginBloc>(context, listen: false);
  }

  void onChangedCorreo(String? value) {
    loginBloc.add(
      LoginCorreoEvent(value ?? ""),
    );
  }

  void onChangedPassword(String? value) {
    loginBloc.add(
      LoginPasswordEvent(value ?? ""),
    );
  }

  String? validarCorreo(String? value) {
    if (!Validate.isEmail(value ?? "")) {
      loginBloc.add(
        const LoginErrorCorreoEvent("Correo no válido"),
      );
    } else if (value!.isEmpty) {
      loginBloc.add(
        const LoginErrorCorreoEvent("El correo no puede estar vacío"),
      );
    } else {
      loginBloc.add(
        const LoginValidarCorreoEvent(),
      );
    }
    return null;
  }

  String? validarPassword(String? value) {
    if (value!.isEmpty) {
      loginBloc.add(
        const LoginErrorPasswordEvent("La contraseña no puede estar vacía"),
      );
    } else {
      loginBloc.add(
        const LoginValidarPasswordEvent(),
      );
    }
    return null;
  }

  bool isButtonActive() {
    return loginBloc.state.errorCorreo == "" &&
        loginBloc.state.errorPassword == "" &&
        loginBloc.state.correo != "" &&
        loginBloc.state.password != "";
  }

  void getStatus() {
    if (kDebugMode) {
      print("Correo: ${loginBloc.state.correo}");
      print("Contraseña: ${loginBloc.state.password}");
      print("Error Correo: ${loginBloc.state.errorCorreo}");
      print("Error Contraseña: ${loginBloc.state.errorPassword}");
    }
  }

  void login() {
    loginBloc.add(const LoginMessageEvent("Iniciando sesión"));
  }
}
