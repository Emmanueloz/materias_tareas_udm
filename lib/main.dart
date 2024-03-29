import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:materias_tareas_udm/blocs/login/login_bloc.dart';
import 'package:materias_tareas_udm/blocs/materias/materias_bloc.dart';
import 'package:materias_tareas_udm/blocs/registrar/registrar_bloc.dart';
import 'package:materias_tareas_udm/blocs/tareas/tareas_bloc.dart';
import 'package:materias_tareas_udm/blocs/usuarios/usuarios_bloc.dart';
import 'package:materias_tareas_udm/screens/acerca_page.dart';
import 'package:materias_tareas_udm/screens/editar_materia_page.dart';
import 'package:materias_tareas_udm/screens/editar_tarea_page.dart';
import 'package:materias_tareas_udm/screens/login_page.dart';
import 'package:materias_tareas_udm/screens/materias_page.dart';
import 'package:materias_tareas_udm/screens/registrar_page.dart';
import 'package:materias_tareas_udm/screens/tareas_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => RegistrarBloc()),
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => MateriasBloc()),
        BlocProvider(create: (_) => UsuariosBloc()),
        BlocProvider(create: (_) => TareasBloc()),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme.light(
            //rgb(0, 181, 150)
            primary: Color.fromRGBO(1, 167, 138, 1),
            secondary: Color.fromRGBO(0, 85, 112, 1),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            centerTitle: true,
          ),
        ),
        initialRoute: 'login',
        routes: {
          'login': (_) => const LoginPage(),
          'registrar': (_) => const RegistrarPage(),
          'materias': (_) => const MateriasPage(),
          'editarMateria': (_) => const EditarMateriaPage(),
          'tareas': (_) => const TareasPage(),
          'editarTarea': (_) => const EditarTareaPage(),
          'acerca': (_) => const AcercaPage(),
        },
      ),
    );
  }
}
