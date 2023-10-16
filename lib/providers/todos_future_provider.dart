import 'package:request_placeholder/models/todo.dart';
import 'package:request_placeholder/repository/todo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todos_future_provider.g.dart';

@riverpod
Future<List<Todo>> todosFutureProvider(TodosFutureProviderRef ref) {
  final todoRepository = TodoRepository();
  return todoRepository.fetchTodos();
}
