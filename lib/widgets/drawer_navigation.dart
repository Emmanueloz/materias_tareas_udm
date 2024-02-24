import 'package:flutter/material.dart';

class DrawerNavigation extends StatelessWidget {
  const DrawerNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    Container itemList(String title, String routeName) {
      return Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
            border: Border.all(
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(context, routeName);
          },
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(240, 184, 67, 1),
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/img/escudo-udm.png",
                  width: 40,
                  height: 40,
                ),
                const Text(
                  'Evaluación Docente',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              itemList("Materias", 'materias'),
              itemList("Tareas", 'tareas'),
            ],
          )
        ],
      ),
    );
  }
}
