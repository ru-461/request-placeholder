import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/router.dart';

// ロガー
final logger = Logger();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Request {JSON} Placeholder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, brightness: Brightness.light),
      darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      routerConfig: router,
    );
  }
}
