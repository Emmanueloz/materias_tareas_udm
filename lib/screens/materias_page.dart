import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materias_tareas_udm/blocs/materias/materias_bloc.dart';
import 'package:materias_tareas_udm/controllers/materia_controller.dart';
import 'package:materias_tareas_udm/screens/base_page.dart';
import 'package:materias_tareas_udm/widgets/card_item.dart';
import 'package:materias_tareas_udm/widgets/drawer_navigation.dart';
import 'package:materias_tareas_udm/widgets/full_button.dart';
import 'package:materias_tareas_udm/widgets/text_input.dart';

class MateriasPage extends StatelessWidget {
  const MateriasPage({super.key});

  @override
  Widget build(BuildContext context) {
    MateriaController controller = MateriaController(context: context);
    controller.getMaterias();
    return BasePage(
      title: "Materias",
      isLogout: true,
      cleanLogout: () {
        controller.cleanLogout();
      },
      drawer: DrawerNavigation(
        nombre: controller.usuariosBloc.state.nombre,
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
                  onChanged: (value) {
                    controller.addNombreMateria(value ?? "");
                    return null;
                  },
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                FullButton(
                  label: "Agregar Materia",
                  //rgb(82, 99, 239)
                  backgroundColor: const Color.fromRGBO(82, 99, 239, 1),
                  color: Colors.white,
                  onPressed: state.nombre.trim().isNotEmpty
                      ? () => controller.addMateria()
                      : null,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.ltsMaterias.length,
                    itemBuilder: (context, index) => CardItem(
                      id: index,
                      title: state.ltsMaterias[index].nombre,
                      onDeleted: () => controller.deleteMaterial(
                        state.ltsMaterias[index],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
