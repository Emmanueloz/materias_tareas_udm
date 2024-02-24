import 'package:flutter/material.dart';
import 'package:materias_tareas_udm/screens/base_page.dart';
import 'package:materias_tareas_udm/widgets/text_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "Evaluación Docente",
      isLogout: false,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          margin: const EdgeInsets.symmetric(vertical: 80),
          child: Column(
            children: [
              Image.asset(
                "assets/img/escudo-udm.png",
                width: 150,
                height: 150,
              ),
              const TextInput(
                label: "Usuario",
                textInputType: TextInputType.emailAddress,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              const TextInput(
                label: "Contraseña",
                isObscureText: true,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'materias');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(240, 184, 67, 1),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Iniciar Sesión",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
