import 'package:flutter/material.dart';

class DrawerNavigation extends StatelessWidget {
  final String? nombre;
  final String? correo;
  const DrawerNavigation({super.key, this.nombre, this.correo});

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
            Navigator.popAndPushNamed(context, routeName);
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
          UserAccountsDrawerHeader(
            currentAccountPicture: Image.asset(
              "assets/img/logo.png",
              width: 150,
              height: 150,
            ),
            accountName: Row(
              children: [
                const Icon(Icons.person),
                const Padding(padding: EdgeInsets.only(left: 10)),
                const Text(
                  "Nombre: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(nombre ?? "")
              ],
            ),
            accountEmail: Row(
              children: [
                const Icon(Icons.email),
                const Padding(padding: EdgeInsets.only(left: 10)),
                const Text(
                  "Correo: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(correo ?? "")
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              itemList("Materias", 'materias'),
              itemList("Tareas", 'tareas'),
              itemList("Acerca de", 'acerca'),
            ],
          )
        ],
      ),
    );
  }
}
