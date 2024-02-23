import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final String title;
  final bool isLogout;
  final Widget? drawer;
  final Widget? body;

  const BasePage({
    super.key,
    required this.title,
    this.isLogout = false,
    this.body,
    this.drawer,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> actionsList = [];
    if (isLogout) {
      actionsList.add(
        IconButton(
          onPressed: () {
            // ignore: avoid_print
            print("cerrar sesión");
            Navigator.pushReplacementNamed(context, 'login');
          },
          icon: const Icon(Icons.exit_to_app),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actionsList,
      ),
      drawer: drawer,
      body: body,
    );
  }
}
