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
}
