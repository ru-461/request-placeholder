import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/components/comment_view.dart';
import 'package:request_placeholder/models/comment.dart';
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
            child: RefreshIndicator(
      onRefresh: () async {
        // 再フェッチ
        futureComments = _repository.fetchComments();
        setState(() {});
      },
      child: FutureBuilder(
          future: futureComments,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // 待機中
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // エラー
              return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error.'),
                  ]);
            } else {
              // 成功時
              final data = snapshot.data;

              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Comment comment = data![index];
                    return CommentView(comment: comment);
                  });
            }
          }),
    )));
  }
}
