import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materias_tareas_udm/blocs/registrar/registrar_bloc.dart';
import 'package:materias_tareas_udm/utils/validador.dart';

class RegistrarController {
  final BuildContext context;
  late final RegistrarBloc registrarBloc;

  final Map<String, String> formValue = {
    'nombre': '',
    'correo': '',
    'password': '',
  };

  RegistrarController({required this.context}) {
    registrarBloc = BlocProvider.of<RegistrarBloc>(context, listen: false);
  }

  String? validarNombre(String? value) {
    if (!Validate.isName(value ?? '')) {
      registrarBloc.add(
        const ErrorRegistrarUsuarioEvent("No se aceptan números"),
      );
    } else if (value!.isEmpty) {
      registrarBloc.add(
        const ErrorRegistrarUsuarioEvent("El nombre no puede estar vacío"),
      );
    } else {
      registrarBloc.add(
        const ValidarUsuarioEvent(),
      );
    }
    return null;
  }

  void onChangedNombre(String? value) {
    registrarBloc.add(
      RegistrarNombreEvent(value ?? ''),
    );
  }

  String? validarCorreo(String? value) {
    if (!Validate.isEmail(value ?? '')) {
      registrarBloc.add(
        const ErrorRegistrarCorreoEvent("Correo no válido"),
      );
    } else if (value!.isEmpty) {
      registrarBloc.add(
        const ErrorRegistrarCorreoEvent("El correo no puede estar vacío"),
      );
    } else {
      registrarBloc.add(
        const ValidarCorreoEvent(),
      );
    }
    return null;
  }

  void onChangedCorreo(String? value) {
    registrarBloc.add(
      RegistrarCorreoEvent(value ?? ''),
    );
  }

  String? validarPassword(String? value) {
    if (!Validate.isPassword(value ?? '')) {
      registrarBloc.add(
        const ErrorRegistrarPasswordEvent(
            "La contraseña debe tener al menos 4 caracteres"),
      );
    } else if (value!.isEmpty) {
      registrarBloc.add(
        const ErrorRegistrarPasswordEvent("La contraseña no puede estar vacía"),
      );
    } else {
      registrarBloc.add(
        const ValidarPasswordEvent(),
      );
    }
    return null;
  }

  void onChangedPassword(String? value) {
    registrarBloc.add(
      RegistrarPasswordEvent(value ?? ''),
    );
  }

  bool isButtonActive() {
    print(registrarBloc.state.errorCorreo);
    return registrarBloc.state.errorCorreo == "" &&
        registrarBloc.state.errorUsuario == "" &&
        registrarBloc.state.errorPassword == "" &&
        registrarBloc.state.nombre != "" &&
        registrarBloc.state.correo != "" &&
        registrarBloc.state.password != "";
  }

  /// Función que imprime en consola el estado actual del formulario
  void getStateDebug() {
    if (kDebugMode) {
      print("error correo: ${registrarBloc.state.errorCorreo}");
      print("error nombre: ${registrarBloc.state.errorUsuario}");
      print("error password: ${registrarBloc.state.errorPassword}");
      print("nombre: ${registrarBloc.state.nombre}");
      print("correo: ${registrarBloc.state.correo}");
      print("password: ${registrarBloc.state.password}");
    }
  }
}
