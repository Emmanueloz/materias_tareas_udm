import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materias_tareas_udm/blocs/tareas/tareas_bloc.dart';
import 'package:materias_tareas_udm/controllers/tarea_controller.dart';
import 'package:materias_tareas_udm/models/tareas.dart';
import 'package:materias_tareas_udm/screens/base_page.dart';
import 'package:materias_tareas_udm/widgets/drawer_navigation.dart';
import 'package:materias_tareas_udm/widgets/full_button.dart';
import 'package:materias_tareas_udm/widgets/select_input.dart';
import 'package:materias_tareas_udm/widgets/text_input.dart';

class EditarTareaPage extends StatelessWidget {
  const EditarTareaPage({super.key});

  @override
  Widget build(BuildContext context) {
    TareaController controller = TareaController(context: context);
    controller.cleanStatus();

    Object? tarea = ModalRoute.of(context)!.settings.arguments;
    if (tarea is Tareas) {
      controller.onChangeNombreTarea(tarea.titulo);
      controller.onChangeMateriaTarea(tarea.materia);
    }

    return BasePage(
      title: "Editar Tarea",
      isLogout: true,
      cleanLogout: () {
        controller.cleanLogout();
      },
      drawer: DrawerNavigation(
        nombre: controller.usuariosBloc.state.nombre,
        correo: controller.usuariosBloc.state.correo,
      ),
      body: BlocBuilder<TareasBloc, TareasState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                TextInput(
                  label: 'Titulo',
                  controller: controller.nombreController,
                  onChanged: (value) {
                    controller.onChangeNombreTarea(value ?? "");
                    return null;
                  },
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                SelectInput(
                  items: controller.materiasBloc.state.ltsMaterias,
                  value: tarea is Tareas ? tarea.materia : "",
                  onChanged: (value) {
                    controller.onChangeMateriaTarea(value);
                  },
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                FullButton(
                  label: "Editar Tarea",
                  //rgb(82, 99, 239)
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  color: Colors.white,
                  onPressed: !controller.isButtonActive()
                      ? null
                      : () {
                          controller.getStatus();
                        },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
