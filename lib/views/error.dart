import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Error extends StatelessWidget {
  const Error({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Page not found.'),
        ElevatedButton(
            onPressed: () => context.go('/'), child: const Text('Home'))
      ],
    )));
  }
}
