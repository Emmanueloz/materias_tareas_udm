import 'package:flutter/material.dart';
import 'package:materias_tareas_udm/screens/base_page.dart';
import 'package:materias_tareas_udm/widgets/card_item.dart';
import 'package:materias_tareas_udm/widgets/drawer_navigation.dart';

class TareasPage extends StatelessWidget {
  const TareasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "title",
      isLogout: true,
      drawer: const DrawerNavigation(),
      body: ListView(
        children: const [
          CardItem(
            id: 1,
            title: "Evaluacion 1",
            subtitle: "Maestro",
            isAnswered: false,
          ),
          CardItem(
            id: 1,
            title: "Evaluacion 1",
            subtitle: "Maestro",
            isAnswered: false,
          ),
          CardItem(
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
