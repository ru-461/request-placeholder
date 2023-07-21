import 'package:flutter/material.dart';
import 'package:request_placeholder/models/comment.dart';

class CommentView extends StatelessWidget {
  final Comment comment;
  const CommentView({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            comment.name,
            style: const TextStyle(fontSize: 18),
          ),
          subtitle: Text(
            comment.body,
            style: const TextStyle(fontSize: 14),
          ),
        ),
        const Divider()
      ],
    );
  }
}
