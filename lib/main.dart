import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Request {JSON} Placeholder',
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
          children: const [
            Text(
              'Hello {JSON} Placeholder.',
              style: TextStyle(color: Colors.blue, fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
