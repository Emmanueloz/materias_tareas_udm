import 'package:flutter/material.dart';
import 'package:materias_tareas_udm/models/materias.dart';

class SelectInput extends StatelessWidget {
  final List<Materias>? items;
  final String? value;
  final Function(dynamic)? onChanged;
  SelectInput({super.key, required this.items, this.onChanged, this.value});

  final List<DropdownMenuItem> _items = [];

  @override
  Widget build(BuildContext context) {
    if (items != null && items!.isNotEmpty) {
      for (var tarea in items!) {
        _items.add(
          DropdownMenuItem(
            value: tarea.nombre.toString(),
            child: Text(tarea.nombre.toString()),
          ),
        );
      }
    }
    //print(items);
    //print(_items);

    return DropdownButtonFormField(
      decoration: const InputDecoration(label: Text('Materia')),
      value: value,
      items: _items.toList(),
      onChanged: onChanged,
    );
  }
}
