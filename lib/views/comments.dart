import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/model/comment.dart';
import 'package:request_placeholder/repository/comment_repository.dart';

final logger = Logger();

class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  late Future<List<Comment>> futureComments;
  final _repository = CommentRepository();

  @override
  void initState() {
    super.initState();
    // フェッチ
    futureComments = _repository.fetchComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: FutureBuilder(
                future: futureComments,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // データあり
                    final data = snapshot.data;
                    return ListView.builder(itemBuilder: (context, index) {
                      return ListTile(title: Text(data![index].body));
                    });
                  } else if (snapshot.hasError) {
                    logger.d(snapshot);
                    // エラ-
                    return const Text('Fetch faild.');
                  } else {
                    // データなし
                    return const CircularProgressIndicator();
                  }
                })));
  }
}
