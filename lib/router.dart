import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:request_placeholder/view/Photos.dart';
import 'package:request_placeholder/view/albums.dart';
import 'package:request_placeholder/view/base.dart';
import 'package:request_placeholder/view/comments.dart';
import 'package:request_placeholder/view/home.dart';
import 'package:request_placeholder/view/posts.dart';
import 'package:request_placeholder/view/settings.dart';
import 'package:request_placeholder/view/todos.dart';
import 'package:request_placeholder/view/users.dart';

// キー
final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

// ルート
final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/posts',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => Base(child: child),
        routes: <RouteBase>[
          GoRoute(
            path: '/home',
            builder: (BuildContext context, GoRouterState state) {
              return const Home();
            },
          ),
          GoRoute(
            path: '/settings',
            builder: (BuildContext context, GoRouterState state) {
              return const Settings();
            },
          ),
          GoRoute(
            path: '/posts',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _noneTransitionPage(child: Posts());
            },
          ),
          GoRoute(
            path: '/comments',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _noneTransitionPage(child: Comments());
            },
          ),
          GoRoute(
            path: '/albums',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _noneTransitionPage(child: Albums());
            },
          ),
          GoRoute(
            path: '/photos',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _noneTransitionPage(child: Photos());
            },
          ),
          GoRoute(
            path: '/todos',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _noneTransitionPage(child: Todos());
            },
          ),
          GoRoute(
            path: '/users',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return _noneTransitionPage(child: Users());
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
