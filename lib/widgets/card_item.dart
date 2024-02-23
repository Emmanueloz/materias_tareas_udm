import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final int id;
  final String teacherName;
  final String subjectName;
  final bool isAnswered;
  const CardItem({
    super.key,
    required this.id,
    required this.teacherName,
    required this.subjectName,
    required this.isAnswered,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
      decoration: BoxDecoration(
          border: Border.all(
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, 'evaluacion', arguments: id);
        },
        trailing: Icon(isAnswered ? Icons.check : Icons.open_in_new),
        title: Text(
          teacherName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subjectName),
      ),
    );
  }
}
