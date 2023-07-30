import 'package:flutter/material.dart';
import 'package:request_placeholder/models/comment.dart';

class CommentView extends StatelessWidget {
  final Comment comment;
  const CommentView({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 5,
          child: ListTile(
            title: Text(
              comment.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
      ],
    );
  }
}
