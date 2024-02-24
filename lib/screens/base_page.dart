import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final String title;
  final bool isLogout;
  final Widget? drawer;
  final Widget? body;
  final bool automaticallyImplyLeading;

  const BasePage({
    super.key,
    required this.title,
    this.isLogout = false,
    this.body,
    this.drawer,
    this.automaticallyImplyLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> actionsList = [];
    if (isLogout) {
      actionsList.add(
        IconButton(
          onPressed: () {
            //Navigator.popAndPushNamed(context, 'login');
            //Navigator.pushReplacementNamed(context, 'login');
            Navigator.pushNamedAndRemoveUntil(
                context, 'login', (route) => false);
          },
          icon: const Icon(Icons.exit_to_app),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actionsList,
        automaticallyImplyLeading: automaticallyImplyLeading,
      ),
      drawer: drawer,
      body: body,
    );
  }
}
