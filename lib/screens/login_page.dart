import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materias_tareas_udm/blocs/login/login_bloc.dart';
import 'package:materias_tareas_udm/controllers/login_controller.dart';
import 'package:materias_tareas_udm/screens/base_page.dart';
import 'package:materias_tareas_udm/widgets/full_button.dart';
import 'package:materias_tareas_udm/widgets/text_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = LoginController(context: context);
    controller.cleanStatus();
    return BasePage(
      title: "Iniciar Sesión",
      isLogout: false,
      automaticallyImplyLeading: false,
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (_, state) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(vertical: 80),
              child: Column(
                children: [
                  Image.asset(
                    "assets/img/logo.png",
                    width: 150,
                    height: 150,
                  ),
                  TextInput(
                    label: "Correo",
                    textInputType: TextInputType.emailAddress,
                    errorText: state.errorCorreo,
                    onChanged: (value) {
                      controller.onChangedCorreo(value);
                      return controller.validarCorreo(value);
                    },
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  TextInput(
                    label: "Contraseña",
                    isObscureText: true,
                    errorText: state.errorPassword,
                    onChanged: (value) {
                      controller.onChangedPassword(value);
                      return controller.validarPassword(value);
                    },
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  FullButton(
                    label: "Iniciar Sesión",
                    color: Colors.black,
                    backgroundColor: const Color.fromRGBO(240, 184, 67, 1),
                    onPressed: !controller.isButtonActive()
                        ? null
                        : () {
                            controller.login();
                          },
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  FullButton(
                    label: "Registrar",
                    color: Colors.black,
                    backgroundColor: const Color.fromRGBO(231, 228, 237, 1),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'registrar');
                    },
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  SizedBox(
                    height: 100,
                    child: Text(state.message),
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
