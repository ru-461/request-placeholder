import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:request_placeholder/view/Comments.dart';
import 'package:request_placeholder/view/Photos.dart';
import 'package:request_placeholder/view/Todos.dart';
import 'package:request_placeholder/view/Users.dart';
import 'package:request_placeholder/view/albums.dart';
import 'package:request_placeholder/view/base.dart';
import 'package:request_placeholder/view/home.dart';
import 'package:request_placeholder/view/posts.dart';

// キー
final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

// ルート
final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => Base(child: child),
        routes: <RouteBase>[
          GoRoute(
            path: '/',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _noneTransitionPage(child: const Home());
            },
          ),
          GoRoute(
            path: '/posts',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _noneTransitionPage(child: const Posts());
            },
          ),
          GoRoute(
            path: '/comments',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _noneTransitionPage(child: const Comments());
            },
          ),
          GoRoute(
            path: '/albums',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _noneTransitionPage(child: const Albums());
            },
          ),
          GoRoute(
            path: '/photos',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _noneTransitionPage(child: const Photos());
            },
          ),
          GoRoute(
            path: '/todos',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _noneTransitionPage(child: const Todos());
            },
          ),
          GoRoute(
            path: '/users',
            builder: (BuildContext context, GoRouterState state) {
              return const Users();
            },
          ),
        ])
  ],
);

// アニメーションなしトランジション
CustomTransitionPage _noneTransitionPage({
  required Widget child,
}) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
    transitionDuration: const Duration(milliseconds: 0),
  );
}
