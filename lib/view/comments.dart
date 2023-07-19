import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/repository/comments_repository.dart';

final logger = Logger();

class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final _repository = CommentsRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _repository.fetchComments(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // データあり
                final data = snapshot.data;
                return ListView.builder(itemBuilder: (context, index) {
                  return ListTile(title: Text(data![index].email));
                });
              } else if (snapshot.hasError) {
                logger.d(snapshot);
                // エラ-
                return const Center(child: Text('Fetch faild.'));
              } else {
                // データなし
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
