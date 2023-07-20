import 'package:flutter/material.dart';
import 'package:request_placeholder/models/todo.dart';

class TodoView extends StatelessWidget {
  final Todo todo;
  const TodoView({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Checkbox(
            value: todo.completed,
            onChanged: (newValue) {},
          ),
          title: Text(
            todo.title,
            style: const TextStyle(fontSize: 18),
          ),
          subtitle: Text(
            todo.title,
            style: const TextStyle(fontSize: 14),
          ),
        ),
        const Divider()
      ],
    );
  }
}
