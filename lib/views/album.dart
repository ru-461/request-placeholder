import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/providers/album_provider.dart';

final logger = Logger();

class Albums extends ConsumerWidget {
  const Albums({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final album = ref.watch(albumProvider(id));

    return Scaffold(
      body: Center(
          child: album.when(
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
