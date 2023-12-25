import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:request_placeholder/constants/route.dart';
import 'package:request_placeholder/views/albums.dart';
import 'package:request_placeholder/views/base.dart';
import 'package:request_placeholder/views/comments.dart';
import 'package:request_placeholder/views/error.dart';
import 'package:request_placeholder/views/home.dart';
import 'package:request_placeholder/views/photos.dart';
import 'package:request_placeholder/views/posts.dart';
import 'package:request_placeholder/views/todos.dart';
import 'package:request_placeholder/views/users.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

// キー
final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/posts',
      debugLogDiagnostics: true,
      errorBuilder: (BuildContext context, GoRouterState state) =>
          const Error(),
      routes: <RouteBase>[
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder:
                (BuildContext context, GoRouterState state, Widget child) =>
                    Base(child: child),
            routes: <RouteBase>[
              GoRoute(
                path: Routes.home,
                name: 'home',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return noneTransitionPage(child: const Home());
                },
              ),
              GoRoute(
                path: Routes.posts,
                name: 'posts',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return noneTransitionPage(child: const Posts());
                },
              ),
              GoRoute(
                path: Routes.comments,
                name: 'comments',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return noneTransitionPage(child: const Comments());
                },
              ),
              GoRoute(
                path: Routes.albums,
                name: 'albums',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return noneTransitionPage(child: const Albums());
                },
              ),
              GoRoute(
                path: Routes.photos,
                name: 'photos',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return noneTransitionPage(child: const Photos());
                },
              ),
              GoRoute(
                path: Routes.todos,
                name: 'todos',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return noneTransitionPage(child: const Todos());
                },
              ),
              GoRoute(
                path: Routes.users,
                name: 'users',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return noneTransitionPage(child: const Users());
                },
              ),
            ])
      ]);
}

// アニメーションなしトランジション
CustomTransitionPage noneTransitionPage({
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
