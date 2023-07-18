import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/repository/posts_repository.dart';

final logger = Logger();

class Posts extends StatelessWidget {
  Posts({super.key});

  final _repository = PostsRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _repository.fetchPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // データあり
                final data = snapshot.data;
                return ListView.builder(itemBuilder: (context, index) {
                  return ListTile(title: Text(data![index].body));
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
