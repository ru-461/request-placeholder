import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:request_placeholder/models/comment.dart';

class CommentView extends StatelessWidget {
  final Comment comment;
  const CommentView({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    final int commentId = comment.id;

    return Column(
      children: <Widget>[
        Card(
          elevation: 5,
          child: InkWell(
            onTap: () => context.push('/comments/$commentId'),
            child: ListTile(
              title: Text(
                comment.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  comment.body,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
