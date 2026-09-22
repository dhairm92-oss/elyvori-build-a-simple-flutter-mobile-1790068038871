import 'package:flutter/material.dart';
import '../models/test_item.dart';

class TestItemTile extends StatelessWidget {
  final TestItem item;
  final Function(String) onToggle;

  const TestItemTile({
    Key? key,
    required this.item,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Checkbox(
          value: item.isCompleted,
          onChanged: (bool? value) {
            onToggle(item.id);
          },
        ),
        title: Text(
          item.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            decoration: item.isCompleted ? TextDecoration.lineThrough : null,
            color: item.isCompleted ? Colors.grey : Colors.black87,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            item.description,
            style: TextStyle(
              color: item.isCompleted ? Colors.grey[450] : Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}
