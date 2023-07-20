import 'package:flutter/material.dart';
import 'package:request_placeholder/models/post.dart';

class PostView extends StatelessWidget {
  final Post post;
  const PostView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            post.title,
            style: const TextStyle(fontSize: 18),
          ),
          subtitle: Text(
            post.body,
            style: const TextStyle(fontSize: 14),
          ),
        ),
        const Divider()
      ],
    );
  }
}
