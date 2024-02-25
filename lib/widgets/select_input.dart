import 'package:flutter/material.dart';
import 'package:materias_tareas_udm/models/materias.dart';

class SelectInput extends StatelessWidget {
  final List<Materias>? items;
  final Function(dynamic)? onChanged;
  SelectInput({super.key, required this.items, this.onChanged});

  final List<DropdownMenuItem> _items = [];

  @override
  Widget build(BuildContext context) {
    if (items != null) {
      for (var tarea in items!) {
        _items.add(
          DropdownMenuItem(
            value: tarea.nombre.toString(),
            child: Text(tarea.nombre.toString()),
          ),
        );
      }
    }
    print(items);
    print(_items);

    return DropdownButtonFormField(
      decoration: const InputDecoration(label: Text('Materia')),
      value: items![0].nombre.toString(),
      items: [..._items],
      onChanged: onChanged,
    );
  }
}
