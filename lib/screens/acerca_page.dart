import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materias_tareas_udm/blocs/usuarios/usuarios_bloc.dart';
import 'package:materias_tareas_udm/screens/base_page.dart';
import 'package:materias_tareas_udm/widgets/drawer_navigation.dart';

class AcercaPage extends StatelessWidget {
  const AcercaPage({super.key});

  @override
  Widget build(BuildContext context) {
    UsuariosBloc usuariosBloc = BlocProvider.of<UsuariosBloc>(context);

    return BasePage(
      title: "Acerca de",
      isLogout: true,
      drawer: DrawerNavigation(
        nombre: usuariosBloc.state.nombre,
        correo: usuariosBloc.state.correo,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Desarrollado por:",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            Text(
              "Gustavo Alexander Medina Cifuentes",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Raúl de Jesús Nájera Jiménez",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Roberto Carlos Nuñez Cruz",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "David Emmanuel Ozuna Navarro",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Félix Alexis Sánchez López",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
