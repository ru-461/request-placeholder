import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

// ロガー
final logger = Logger();

class Base extends StatefulWidget {
  const Base({super.key, required this.child});

  // ウィジェット
  final Widget child;

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _selectedIndex = 0;
  String _pageTitle = 'Posts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pageTitle,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(16, 185, 129, 1),
        actions: [
          IconButton(
              onPressed: () => {context.go('/')}, icon: const Icon(Icons.home))
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.article), label: 'Posts'),
          NavigationDestination(icon: Icon(Icons.forum), label: 'Comments'),
          NavigationDestination(icon: Icon(Icons.collections), label: 'Albums'),
          NavigationDestination(
              icon: Icon(Icons.photo_camera), label: 'Photos'),
          NavigationDestination(icon: Icon(Icons.task), label: 'Todos'),
          NavigationDestination(icon: Icon(Icons.people), label: 'Users'),
        ],
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              _selectedIndex = index;
              _pageTitle = 'Posts';
              context.go('/posts');
              break;
            case 1:
              _selectedIndex = index;
              _pageTitle = 'Comments';
              context.go('/comments');
              break;
            case 2:
              _selectedIndex = index;
              _pageTitle = 'Albums';
              context.go('/albums');
              break;
            case 3:
              _selectedIndex = index;
              _pageTitle = 'Photos';
              context.go('/photos');
              break;
            case 4:
              _selectedIndex = index;
              _pageTitle = 'Todos';
              context.go('/todos');
              break;
            case 5:
              _selectedIndex = index;
              _pageTitle = 'Users';
              context.go('/users');
              break;
            default:
              _selectedIndex = index;
              _pageTitle = 'Home';
              context.go('/');
          }
        },
      ),
      body: widget.child,
    );
  }
}
