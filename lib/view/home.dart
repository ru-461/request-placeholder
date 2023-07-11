import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

final logger = Logger();

class Home extends StatefulWidget {
  const Home({super.key});

  final String title = 'Home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _switchRoute() {
    logger.w('OK');
  }

  Future<void> tryIt() async {
    // API URL
    String url = 'https://jsonplaceholder.typicode.com/todos/1';
    // メッセージ
    String message = '';

    try {
      // リクエスト開始
      http.Response response = await http.get(Uri.parse(url));
      logger.i(response.statusCode);

      // ステータスコード確認
      if (response.statusCode == 200) {
        // 成功
        message = response.body;
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
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(16, 185, 129, 1),
      ),
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
