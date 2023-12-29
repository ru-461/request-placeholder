import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/providers/comment_provider.dart';

final logger = Logger();

class Comment extends ConsumerWidget {
  const Comment({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comment = ref.watch(commentProvider(id));

    return Scaffold(
      body: Center(
          child: comment.when(
        data: (data) {
          logger.i(data);
          return const Placeholder();
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const CircularProgressIndicator(),
      )),
    );
  }
}
