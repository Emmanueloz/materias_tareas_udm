import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final String title;
  final bool isLogout;
  final Widget? drawer;
  final Widget? body;
  final bool automaticallyImplyLeading;
  final Function? cleanLogout;

  const BasePage({
    super.key,
    required this.title,
    this.isLogout = false,
    this.body,
    this.drawer,
    this.automaticallyImplyLeading = true,
    this.cleanLogout,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> actionsList = [];
    if (isLogout) {
      actionsList.add(
        IconButton(
          onPressed: () {
            if (cleanLogout != null) {
              cleanLogout!();
            }
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
