import 'package:flutter/material.dart';
import 'package:materias_tareas_udm/screens/login_page.dart';
import 'package:materias_tareas_udm/screens/materias_page.dart';
import 'package:materias_tareas_udm/screens/registrar_page.dart';
import 'package:materias_tareas_udm/screens/tareas_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(2040, 183, 67, 1),
        ),
      ),
      initialRoute: 'login',
      routes: {
        'login': (_) => const LoginPage(),
        'registrar': (_) => const RegistrarPage(),
        'materias': (_) => const MateriasPage(),
        'tareas': (_) => const TareasPage(),
      },
    );
  }
}
