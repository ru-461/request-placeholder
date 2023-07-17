import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:request_placeholder/constant/url.dart';

// ロガー
final logger = Logger();

class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  Future<void> _fetchTodos() async {
    // URL
    String url = URL.todos;
    // レスポンス
    String message = '';
    dynamic responseData;

    try {
      // リクエスト開始
      http.Response response = await http.get(Uri.parse(url));
      logger.i(response.statusCode);

      // ステータスコード確認
      if (response.statusCode == 200) {
        // 成功
        responseData = jsonDecode(response.body);
        message = response.body;
        logger.d(responseData);
      } else {
        // 失敗
        message = 'Failed to access API.';
      }
    } catch (error) {
      // 例外
      message = 'Request error.';
    }

    // ダイアログ表示
    setState(() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Result'),
            content: Text(message),
            scrollable: true,
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: _fetchTodos,
                style: ElevatedButton.styleFrom(),
                child: const Text('Fetch'))
          ],
        ),
      ),
    );
  }
}
