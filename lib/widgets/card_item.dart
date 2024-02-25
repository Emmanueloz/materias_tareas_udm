import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final int id;
  final String title;
  final String? subtitle;
  final VoidCallback? onDeleted;
  final VoidCallback? onEdited;
  const CardItem({
    super.key,
    required this.id,
    required this.title,
    this.subtitle,
    this.onDeleted,
    this.onEdited,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      secondaryBackground: Container(
        color: Colors.green,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          if (onDeleted != null) {
            onDeleted!();
          }
        } else {
          if (onEdited != null) {
            onEdited!();
          }
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(subtitle ?? ""),
        ),
      ),
    );
  }
}
