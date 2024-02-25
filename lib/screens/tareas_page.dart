import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materias_tareas_udm/blocs/tareas/tareas_bloc.dart';
import 'package:materias_tareas_udm/controllers/tarea_controller.dart';
import 'package:materias_tareas_udm/screens/base_page.dart';
import 'package:materias_tareas_udm/widgets/card_item.dart';
import 'package:materias_tareas_udm/widgets/drawer_navigation.dart';
import 'package:materias_tareas_udm/widgets/full_button.dart';
import 'package:materias_tareas_udm/widgets/select_input.dart';
import 'package:materias_tareas_udm/widgets/text_input.dart';

class TareasPage extends StatelessWidget {
  const TareasPage({super.key});

  @override
  Widget build(BuildContext context) {
    TareaController controller = TareaController(context: context);
    controller.getTareas();

    return BasePage(
      title: "Tareas",
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
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                TextInput(
                  label: 'Titulo',
                  onChanged: (value) {
                    controller.onChangeNombreTarea(value ?? "");
                    return null;
                  },
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                SelectInput(
                  items: controller.materiasBloc.state.ltsMaterias,
                  value: controller.materiasBloc.state.ltsMaterias.isNotEmpty
                      ? controller.materiasBloc.state.ltsMaterias[0].nombre
                      : null,
                  onChanged: (value) {
                    controller.onChangeMateriaTarea(value);
                  },
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                FullButton(
                  label: "Agregar Tarea",
                  //rgb(82, 99, 239)
                  backgroundColor: const Color.fromRGBO(82, 99, 239, 1),
                  color: Colors.white,
                  onPressed: !controller.isButtonActive()
                      ? null
                      : () {
                          controller.addMaterial();
                        },
                ),
                Expanded(
                    child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.ltsTareas.length,
                  itemBuilder: (context, index) => CardItem(
                    id: index,
                    title: state.ltsTareas[index].titulo,
                    subtitle: state.ltsTareas[index].materia,
                    onDeleted: () => controller.deleteMaterial(
                      state.ltsTareas[index],
                    ),
                  ),
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
