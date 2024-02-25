import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materias_tareas_udm/blocs/tareas/tareas_bloc.dart';
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
    return BasePage(
      title: "Tareas",
      isLogout: true,
      drawer: const DrawerNavigation(),
      body: BlocBuilder<TareasBloc, TareasState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                const TextInput(
                  label: 'Titulo',
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                const SelectInput(),
                const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                FullButton(
                  label: "Agregar Tarea",
                  //rgb(82, 99, 239)
                  backgroundColor: const Color.fromRGBO(82, 99, 239, 1),
                  color: Colors.white,
                  onPressed: () {
                    // ignore: avoid_print
                    print('Agregar');
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
