import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrawerNavigation extends StatelessWidget {
  const DrawerNavigation({super.key});

  Container itemList(String title) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: () {
          // ignore: avoid_print
          print("hola");
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

  @override
  Widget build(BuildContext context) {
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
              itemList("Evaluaciones"),
              itemList("Acerca de"),
            ],
          )
        ],
      ),
    );
  }
}
