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
}
