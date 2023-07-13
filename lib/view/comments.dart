import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

// ロガー
final logger = Logger();

class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
