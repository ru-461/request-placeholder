import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/repository/todo_repository.dart';

final logger = Logger();

class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  final _repository = TodosRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _repository.fetchTodos(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // データあり
                final data = snapshot.data;
                return ListView.builder(itemBuilder: (context, index) {
                  return ListTile(title: Text(data![index].title));
                });
              } else if (snapshot.hasError) {
                // エラ-
                return const Center(child: Text('Fetch faild.'));
              } else {
                // データなし
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
