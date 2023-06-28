import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

final logger = Logger();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Request {JSON} Placeholder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Request {JSON} Placeholder'),
    );
  }
}

final List buttonNames = [
  '/posts',
  '/comments',
  '/albums',
  '/photos',
  '/todos',
  '/users'
];

final List buttonIcons = [
  Icons.article,
  Icons.forum,
  Icons.collections,
  Icons.photo_camera,
  Icons.task,
  Icons.people,
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> tryIt() async {
    // API URL
    String url = 'https://jsonplaceholder.typicode.com/todos/1';
    // リクエスト結果メッセージ
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

    // ウィジェットを再構築してダイアログ表示
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
      ),
      drawer: Drawer(
        child: ListView.builder(
          itemCount: buttonNames.length,
          itemBuilder: (BuildContext context, int index) {
            final buttonName = buttonNames[index];
            final buttonIcon = buttonIcons[index];
            return ListTile(
              title: Text(buttonName),
              leading: Icon(buttonIcon),
              onTap: () {},
            );
          },
        ),
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
