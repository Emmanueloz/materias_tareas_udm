import 'package:flutter/material.dart';
import 'package:materias_tareas_udm/screens/base_page.dart';
import 'package:materias_tareas_udm/widgets/card_item.dart';
import 'package:materias_tareas_udm/widgets/drawer_navigation.dart';
import 'package:materias_tareas_udm/widgets/full_button.dart';
import 'package:materias_tareas_udm/widgets/text_input.dart';

class MateriasPage extends StatelessWidget {
  const MateriasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "Materias",
      isLogout: true,
      drawer: const DrawerNavigation(),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                const TextInput(
                    label: 'Nombre', textInputType: TextInputType.text),
                const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                FullButton(
                  label: "Agregar Materia",
                  //rgb(82, 99, 239)
                  backgroundColor: const Color.fromRGBO(82, 99, 239, 1),
                  color: Colors.white,
                  onPressed: () {
                    print('Agregar');
                  },
                ),
              ],
            ),
          ),
          const CardItem(
            id: 1,
            title: "Evaluacion 1",
            subtitle: "Maestro",
            isAnswered: false,
          ),
          const CardItem(
            id: 1,
            title: "Evaluacion 1",
            subtitle: "Maestro",
            isAnswered: false,
          ),
          const CardItem(
            id: 1,
            title: "Evaluacion 1",
            subtitle: "Maestro",
            isAnswered: false,
          ),
        ],
      ),
    );
  }
}
