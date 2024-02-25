import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materias_tareas_udm/blocs/login/login_bloc.dart';
import 'package:materias_tareas_udm/blocs/usuarios/usuarios_bloc.dart';
import 'package:materias_tareas_udm/models/usuarios.dart';
import 'package:materias_tareas_udm/provider/db_provider.dart';
import 'package:materias_tareas_udm/utils/validador.dart';

class LoginController {
  final BuildContext context;
  late final LoginBloc loginBloc;
  late final UsuariosBloc usuariosBloc;

  LoginController({required this.context}) {
    loginBloc = BlocProvider.of<LoginBloc>(context, listen: false);
    usuariosBloc = BlocProvider.of<UsuariosBloc>(context, listen: false);
  }

  void onChangedCorreo(String? value) {
    loginBloc.add(
      LoginCorreoEvent(value ?? ""),
    );
  }

  void onChangedPassword(String? value) {
    loginBloc.add(
      LoginPasswordEvent(value ?? ""),
    );
  }

  String? validarCorreo(String? value) {
    if (!Validate.isEmail(value ?? "")) {
      loginBloc.add(
        const LoginErrorCorreoEvent("Correo no válido"),
      );
    } else if (value!.isEmpty) {
      loginBloc.add(
        const LoginErrorCorreoEvent("El correo no puede estar vacío"),
      );
    } else {
      loginBloc.add(
        const LoginValidarCorreoEvent(),
      );
    }
    return null;
  }

  String? validarPassword(String? value) {
    if (value!.isEmpty) {
      loginBloc.add(
        const LoginErrorPasswordEvent("La contraseña no puede estar vacía"),
      );
    } else {
      loginBloc.add(
        const LoginValidarPasswordEvent(),
      );
    }
    return null;
  }

  bool isButtonActive() {
    return loginBloc.state.errorCorreo == "" &&
        loginBloc.state.errorPassword == "" &&
        loginBloc.state.correo != "" &&
        loginBloc.state.password != "";
  }

  void getStatus() {
    if (kDebugMode) {
      print("Correo: ${loginBloc.state.correo}");
      print("Contraseña: ${loginBloc.state.password}");
      print("Error Correo: ${loginBloc.state.errorCorreo}");
      print("Error Contraseña: ${loginBloc.state.errorPassword}");
    }
  }

  void cleanStatus() {
    loginBloc.add(
      const LoginResetEvent(),
    );
  }

  void login() async {
    Usuario? usuario = await DBProvider.db.getUsuario(
      loginBloc.state.correo,
    );

    if (usuario == null || usuario.password != loginBloc.state.password) {
      loginBloc.add(
        const LoginMessageEvent("Correo o contraseña incorrectos"),
      );
      return;
    }

    loginBloc.add(
      const LoginMessageEvent(""),
    );

    usuariosBloc.add(
      UsuarioNombreEvent(usuario.nombre),
    );

    usuariosBloc.add(
      UsuarioCorreoEvent(usuario.correo),
    );

    if (context.mounted) {
      Navigator.pushReplacementNamed(context, 'materias');
    }
  }
}
