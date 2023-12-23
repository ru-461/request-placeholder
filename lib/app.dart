import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/providers/go_router_provider.dart';

// ロガー
final logger = Logger();

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
        title: 'Request {JSON} Placeholder',
        debugShowCheckedModeBanner: true,
        theme: ThemeData(useMaterial3: true, brightness: Brightness.light),
        darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
        routerConfig: router);
  }
}
