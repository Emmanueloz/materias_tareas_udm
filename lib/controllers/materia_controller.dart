import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materias_tareas_udm/blocs/materias/materias_bloc.dart';
import 'package:materias_tareas_udm/blocs/usuarios/usuarios_bloc.dart';
import 'package:materias_tareas_udm/models/materias.dart';
import 'package:materias_tareas_udm/provider/db_provider.dart';

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

  void getMaterias() async {
    materiasBloc.add(const MateriasClearEvent());
    List<Materias> materias =
        await DBProvider.db.getMaterias(usuariosBloc.state.correo);
    for (Materias materia in materias) {
      materiasBloc.add(MateriasAddEvent(materia));
    }
  }

  void addNombreMateria(String nombre) {
    materiasBloc.add(MateriasNombreEvent(nombre));
  }

  addMateria() async {
    Materias materia = Materias(
      nombre: materiasBloc.state.nombre,
      idUsuario: usuariosBloc.state.correo,
    );

    await DBProvider.db.nuevaMateria(materia);
    getMaterias();
  }
}
