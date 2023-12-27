import 'package:flutter/material.dart';
import 'package:request_placeholder/models/post.dart';

class PostView extends StatelessWidget {
  final Post post;
  const PostView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          elevation: 5,
          child: ListTile(
              title: Text(
                post.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  post.body,
                  style: const TextStyle(fontSize: 15),
                ),
              )),
        )
      ],
    );
  }
}
