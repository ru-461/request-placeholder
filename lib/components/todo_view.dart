import 'package:flutter/material.dart';
import 'package:request_placeholder/models/todo.dart';

class TodoView extends StatelessWidget {
  final Todo todo;
  const TodoView({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 5,
          child: ListTile(
            leading: Checkbox(
              value: todo.completed,
              onChanged: (newValue) {},
            ),
            title: Text(
              todo.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                todo.title,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ),
        )
      ],
    );
  }
}
