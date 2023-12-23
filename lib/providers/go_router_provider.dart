import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:request_placeholder/views/Photos.dart';
import 'package:request_placeholder/views/albums.dart';
import 'package:request_placeholder/views/base.dart';
import 'package:request_placeholder/views/comments.dart';
import 'package:request_placeholder/views/home.dart';
import 'package:request_placeholder/views/posts.dart';
import 'package:request_placeholder/views/todos.dart';
import 'package:request_placeholder/views/users.dart';

// キー
final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

// ルート
final goRouterProvider = Provider<GoRouter>((ref) => GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/posts',
      debugLogDiagnostics: true,
      routes: <RouteBase>[
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder:
                (BuildContext context, GoRouterState state, Widget child) =>
                    Base(child: child),
            routes: <RouteBase>[
              GoRoute(
                path: '/home',
                name: 'home',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _noneTransitionPage(child: const Home());
                },
              ),
              GoRoute(
                path: '/posts',
                name: 'posts',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _noneTransitionPage(child: const Posts());
                },
              ),
              GoRoute(
                path: '/comments',
                name: 'comments',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _noneTransitionPage(child: const Comments());
                },
              ),
              GoRoute(
                path: '/albums',
                name: 'albums',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _noneTransitionPage(child: const Albums());
                },
              ),
              GoRoute(
                path: '/photos',
                name: 'photos',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _noneTransitionPage(child: const Photos());
                },
              ),
              GoRoute(
                path: '/todos',
                name: 'todos',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _noneTransitionPage(child: const Todos());
                },
              ),
              GoRoute(
                path: '/users',
                name: 'users',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _noneTransitionPage(child: const Users());
                },
              ),
            ])
      ],
    ));

// アニメーションなしトランジション
CustomTransitionPage _noneTransitionPage({
  required Widget child,
}) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (BuildContext context, Animation<dynamic> animation,
        Animation<dynamic> secondaryAnimation, Widget child) {
      return child;
    },
    transitionDuration: const Duration(milliseconds: 0),
  );
}
