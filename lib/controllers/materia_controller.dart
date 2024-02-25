import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materias_tareas_udm/blocs/materias/materias_bloc.dart';
import 'package:materias_tareas_udm/blocs/usuarios/usuarios_bloc.dart';

class MateriaController {
  final BuildContext context;
  late final MateriasBloc materiasBloc;
  late final UsuariosBloc usuariosBloc;

  MateriaController({required this.context}) {
    materiasBloc = BlocProvider.of<MateriasBloc>(
      context,
      listen: false,
    );
    usuariosBloc = BlocProvider.of<UsuariosBloc>(
      context,
      listen: false,
    );
  }

  void addNombreMateria(String nombre) {
    materiasBloc.add(MateriasNombreEvent(nombre));
  }

  addMateria() async {
    print("Agregar");
  }
}
