import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

// ロガー
final logger = Logger();

class Photos extends StatefulWidget {
  const Photos({super.key});

  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
