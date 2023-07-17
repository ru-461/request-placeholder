import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:request_placeholder/constant/url.dart';

// ロガー
final logger = Logger();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> tryIt() async {
    // URL
    String url = '${URL.todos}/' '1';
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
            const Text(
              'Hello {JSON} Placeholder.',
              style: TextStyle(color: Colors.blue, fontSize: 24),
            ),
            ElevatedButton(
              onPressed: tryIt,
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(16, 185, 129, 1)),
              child: const Text(
                'Try it',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
