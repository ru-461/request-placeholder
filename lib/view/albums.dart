import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

// ロガー
final logger = Logger();

class Albums extends StatefulWidget {
  const Albums({super.key});

  @override
  State<Albums> createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
