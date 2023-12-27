import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/providers/post_provider.dart';

final logger = Logger();

class Post extends ConsumerWidget {
  const Post({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = ref.watch(postProvider(id));

    return Scaffold(
      body: Center(
          child: post.when(
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
