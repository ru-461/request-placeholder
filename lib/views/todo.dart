import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/providers/todo_provider.dart';

final logger = Logger();

class Todo extends ConsumerWidget {
  const Todo({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoProvider(id));

    return Scaffold(
      body: Center(
          child: todo.when(
        data: (data) {
          logger.i(data);
          return const Placeholder();
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const CircularProgressIndicator(),
      )),
    );
  }
}
