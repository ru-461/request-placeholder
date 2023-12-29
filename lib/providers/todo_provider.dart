import 'package:request_placeholder/models/todo.dart';
import 'package:request_placeholder/repository/todo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_provider.g.dart';

@riverpod
Future<Todo> todo(TodoRef ref, int id) {
  final todoRepository = TodoRepository();
  return todoRepository.fetchTodo(id);
}
