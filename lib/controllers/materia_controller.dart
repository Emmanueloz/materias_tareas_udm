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

  TextEditingController nombreController = TextEditingController();

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

  void addNombreMateria(String? nombre) {
    materiasBloc.add(MateriasNombreEvent(nombre ?? ""));
    nombreController.text = nombre ?? "";
  }

  addMateria() async {
    Materias materia = Materias(
      nombre: materiasBloc.state.nombre,
      idUsuario: usuariosBloc.state.correo,
    );

    await DBProvider.db.nuevaMateria(materia);
    getMaterias();
  }

  deleteMaterial(Materias materia) async {
    await DBProvider.db.deleteMateria(materia);
    getMaterias();
  }

  void cleanLogout() {
    usuariosBloc.add(const UsuarioLimpiarEvent());
    materiasBloc.add(const MateriasClearEvent());
  }

  void cleanStatus() {
    materiasBloc.add(const MateriasClearEvent());
  }

  editarMateria(int id) {
    //materiasBloc.add(MateriasEditarEvent(materia));
    Materias materia = Materias(
      id: id,
      nombre: materiasBloc.state.nombre,
      idUsuario: usuariosBloc.state.correo,
    );
    DBProvider.db.updateMateria(materia);
    getMaterias();
    Navigator.pop(context);
  }
}
