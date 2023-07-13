import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

// ロガー
final logger = Logger();

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
