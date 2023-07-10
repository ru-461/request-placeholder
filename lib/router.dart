import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:request_placeholder/view/Comments.dart';
import 'package:request_placeholder/view/Photos.dart';
import 'package:request_placeholder/view/Todos.dart';
import 'package:request_placeholder/view/Users.dart';
import 'package:request_placeholder/view/albums.dart';
import 'package:request_placeholder/view/home.dart';
import 'package:request_placeholder/view/posts.dart';

// ルート
final GoRouter router = GoRouter(
  initialLocation: '/home',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
    ),
    GoRoute(
      path: '/posts',
      builder: (BuildContext context, GoRouterState state) {
        return const Posts();
      },
    ),
    GoRoute(
      path: '/comments',
      builder: (BuildContext context, GoRouterState state) {
        return const Comments();
      },
    ),
    GoRoute(
      path: '/albums',
      builder: (BuildContext context, GoRouterState state) {
        return const Albums();
      },
    ),
    GoRoute(
      path: '/photos',
      builder: (BuildContext context, GoRouterState state) {
        return const Photos();
      },
    ),
    GoRoute(
      path: '/todos',
      builder: (BuildContext context, GoRouterState state) {
        return const Todos();
      },
    ),
    GoRoute(
      path: '/users',
      builder: (BuildContext context, GoRouterState state) {
        return const Users();
      },
    ),
  ],
);
