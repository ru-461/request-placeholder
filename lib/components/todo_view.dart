import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:request_placeholder/models/todo.dart';

class TodoView extends StatelessWidget {
  final Todo todo;
  const TodoView({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final int todoId = todo.id;

    return Column(
      children: <Widget>[
        Card(
          elevation: 5,
          child: InkWell(
            onTap: () => context.push('/todos/$todoId'),
            child: ListTile(
              leading: Checkbox(
                value: todo.completed,
                onChanged: (newValue) {},
              ),
              title: Text(
                todo.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  todo.title,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
