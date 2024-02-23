import 'package:flutter/material.dart';
import 'package:materias_tareas_udm/screens/base_page.dart';
import 'package:materias_tareas_udm/widgets/drawer_navigation.dart';

class EvaluacionPage extends StatelessWidget {
  const EvaluacionPage({super.key});

  @override
  Widget build(BuildContext context) {
    Object? id = ModalRoute.of(context)!.settings.arguments;
    return BasePage(
      title: "Evaluación",
      isLogout: true,
      drawer: const DrawerNavigation(),
      body: Center(
        child: Text("Por crear $id"),
      ),
    );
  }
}
