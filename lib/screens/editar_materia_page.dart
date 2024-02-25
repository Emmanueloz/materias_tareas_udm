import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materias_tareas_udm/blocs/materias/materias_bloc.dart';
import 'package:materias_tareas_udm/controllers/materia_controller.dart';
import 'package:materias_tareas_udm/models/materias.dart';
import 'package:materias_tareas_udm/screens/base_page.dart';
import 'package:materias_tareas_udm/widgets/drawer_navigation.dart';
import 'package:materias_tareas_udm/widgets/full_button.dart';
import 'package:materias_tareas_udm/widgets/text_input.dart';

class EditarMateriaPage extends StatelessWidget {
  const EditarMateriaPage({super.key});

  @override
  Widget build(BuildContext context) {
    MateriaController controller = MateriaController(context: context);
    controller.cleanStatus();
    Object? materia = ModalRoute.of(context)!.settings.arguments;
    if (materia is Materias) {
      controller.addNombreMateria(materia.nombre);
    }

    return BasePage(
        title: "Editar Materia",
        isLogout: true,
        drawer: DrawerNavigation(
          correo: controller.usuariosBloc.state.correo,
        ),
        body: BlocBuilder<MateriasBloc, MateriasState>(
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  TextInput(
                    label: 'Nombre',
                    textInputType: TextInputType.text,
                    controller: controller.nombreController,
                    onChanged: (value) {
                      controller.addNombreMateria(value ?? "");
                      return null;
                    },
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  FullButton(
                    label: "Editar Materia",
                    //rgb(82, 99, 239)
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    color: Colors.white,
                    onPressed:
                        state.nombre.trim().isNotEmpty && materia is Materias
                            ? () => controller.editarMateria(materia.id)
                            : null,
                  ),
                ],
              ),
            );
          },
        ));
  }
}
