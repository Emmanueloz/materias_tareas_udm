import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materias_tareas_udm/blocs/materias/materias_bloc.dart';
import 'package:materias_tareas_udm/blocs/tareas/tareas_bloc.dart';
import 'package:materias_tareas_udm/blocs/usuarios/usuarios_bloc.dart';
import 'package:materias_tareas_udm/models/tareas.dart';
import 'package:materias_tareas_udm/provider/db_provider.dart';

class TareaController {
  final BuildContext context;
  late final TareasBloc tareasBloc;
  late final MateriasBloc materiasBloc;
  late final UsuariosBloc usuariosBloc;

  TareaController({required this.context}) {
    tareasBloc = BlocProvider.of<TareasBloc>(context, listen: false);
    usuariosBloc = BlocProvider.of<UsuariosBloc>(context, listen: false);
    materiasBloc = BlocProvider.of<MateriasBloc>(context, listen: false);
  }

  void getTareas() async {
    tareasBloc.add(const TareasClearEvent());
    List<Tareas> tareas =
        await DBProvider.db.getTareas(usuariosBloc.state.correo);
    for (Tareas tarea in tareas) {
      tareasBloc.add(TareasAddEvent(tarea));
    }
  }

  void onChangeNombreTarea(String titulo) {
    tareasBloc.add(TareasNombreEvent(titulo));
  }

  void onChangeMateriaTarea(String materia) {
    tareasBloc.add(TareasMateriaEvent(materia));
  }

  bool isButtonActive() {
    return tareasBloc.state.nombre.isNotEmpty &&
        tareasBloc.state.materia.isNotEmpty &&
        materiasBloc.state.ltsMaterias.isNotEmpty;
  }

  void getStatus() {
    if (kDebugMode) {
      print(tareasBloc.state.nombre);
      print(tareasBloc.state.materia);
      print(tareasBloc.state.ltsTareas);
      print(materiasBloc.state.ltsMaterias);
    }
  }

  addMaterial() async {
    Tareas tarea = Tareas(
      titulo: tareasBloc.state.nombre,
      materia: tareasBloc.state.materia,
      completada: false,
      idUsuario: usuariosBloc.state.correo,
    );

    await DBProvider.db.nuevaTarea(tarea);
    getTareas();
  }
}
