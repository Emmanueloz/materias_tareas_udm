import 'package:flutter/material.dart';

class SelectInput extends StatelessWidget {
  const SelectInput({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(label: Text('Materia')),
      value: 2,
      items: const [
        DropdownMenuItem(
          value: 1,
          child: Text('Expresión'),
        ),
        DropdownMenuItem(
          value: 2,
          child: Text('Ingles 1'),
        )
      ],
      onChanged: (value) => print(value),
    );
  }
}
