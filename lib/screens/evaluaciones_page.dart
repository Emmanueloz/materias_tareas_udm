import 'package:flutter/material.dart';
import 'package:materias_tareas_udm/screens/base_page.dart';
import 'package:materias_tareas_udm/widgets/card_item.dart';
import 'package:materias_tareas_udm/widgets/drawer_navigation.dart';

class EvaluacionesPage extends StatelessWidget {
  const EvaluacionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "Evaluaciones",
      isLogout: true,
      drawer: const DrawerNavigation(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                CardItem(
                  id: 1,
                  teacherName: "Evaluacion 1",
                  subjectName: "Maestro",
                  isAnswered: false,
                ),
                CardItem(
                  id: 2,
                  teacherName: "Evaluacion 1",
                  subjectName: "Maestro",
                  isAnswered: false,
                ),
                CardItem(
                  id: 3,
                  teacherName: "Evaluacion 1",
                  subjectName: "Maestro",
                  isAnswered: false,
                ),
                CardItem(
                  id: 4,
                  teacherName: "Evaluacion 1",
                  subjectName: "Maestro",
                  isAnswered: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
