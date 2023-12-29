import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/providers/user_provider.dart';

final logger = Logger();

class User extends ConsumerWidget {
  const User({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider(id));

    return Scaffold(
      body: Center(
          child: user.when(
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
