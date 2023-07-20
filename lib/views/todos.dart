import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/components/todo_view.dart';
import 'package:request_placeholder/models/todo.dart';
import 'package:request_placeholder/repository/todo_repository.dart';

final logger = Logger();

class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  late Future<List<Todo>> futureTodos;
  final _repository = TodoRepository();

  @override
  void initState() {
    super.initState();
    // フェッチ
    futureTodos = _repository.fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () async {
        // 再フェッチ
        futureTodos = _repository.fetchTodos();
        setState(() {});
      },
      child: FutureBuilder(
          future: futureTodos,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // 待機中
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // エラー
              return const Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text('Error.'),
                  ]));
            } else {
              // 成功時
              final data = snapshot.data;

              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Todo todo = data![index];
                    return TodoView(todo: todo);
                  });
            }
          }),
    ));
  }
}
