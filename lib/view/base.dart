import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Base extends StatefulWidget {
  const Base({Key? key, required this.child}) : super(key: key);

  // ウィジェット
  final Widget child;

  @override
  _BaseState createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              context.go('/');
              break;
            case 1:
              context.go('/posts');
              break;
            case 2:
              context.go('/comments');
              break;
            case 3:
              context.go('/albums');
              break;
            case 4:
              context.go('/photos');
              break;
            case 5:
              context.go('/todos');
              break;
            case 6:
              context.go('/users');
              break;
            default:
              context.go('/');
          }
          setState(() {
            // インデックスを更新
            _selectedIndex = index;
          });
        },
      ),
      body: widget.child,
    );
  }
}
