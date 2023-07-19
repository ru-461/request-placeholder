import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/repository/posts_repository.dart';

final logger = Logger();

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  final _repository = PostsRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _repository.fetchPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // データあり
                // final data = snapshot.data;
                return ListView.builder(itemBuilder: (context, index) {
                  return const ListTile(title: Text(''));
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
