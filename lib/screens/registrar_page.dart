import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materias_tareas_udm/blocs/registrar/registrar_bloc.dart';
import 'package:materias_tareas_udm/controllers/registrar_controller.dart';
import 'package:materias_tareas_udm/screens/base_page.dart';
import 'package:materias_tareas_udm/widgets/full_button.dart';
import 'package:materias_tareas_udm/widgets/text_input.dart';

class RegistrarPage extends StatelessWidget {
  const RegistrarPage({super.key});

  @override
  Widget build(BuildContext context) {
    RegistrarController controller = RegistrarController(context: context);

    return BasePage(
      title: "Registrarse",
      isLogout: false,
      automaticallyImplyLeading: false,
      body: BlocBuilder<RegistrarBloc, RegistrarState>(
        builder: (_, state) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  Image.asset(
                    "assets/img/escudo-udm.png",
                    width: 150,
                    height: 150,
                  ),
                  TextInput(
                    label: "Usuario",
                    errorText: state.errorUsuario,
                    onChanged: (value) {
                      controller.onChangedNombre(value);
                      return controller.validarNombre(value);
                    },
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  TextInput(
                    label: "Correo Electrónico",
                    textInputType: TextInputType.emailAddress,
                    errorText: state.errorCorreo,
                    onChanged: (value) {
                      controller.onChangedCorreo(value);
                      return controller.validarCorreo(value);
                    },
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  const TextInput(
                    label: "Contraseña",
                    isObscureText: true,
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  FullButton(
                    label: "Registrarse",
                    color: Colors.black,
                    backgroundColor: const Color.fromRGBO(240, 184, 67, 1),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'materias');
                    },
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  FullButton(
                    label: "Iniciar Sesión",
                    color: Colors.black,
                    backgroundColor: const Color.fromRGBO(231, 228, 237, 1),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'login');
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
