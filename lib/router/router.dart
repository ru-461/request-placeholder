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
      initialLocation: '/',
      debugLogDiagnostics: true,
      errorBuilder: (BuildContext context, GoRouterState state) =>
          const Error(),
      routes: <RouteBase>[
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder:
                (BuildContext context, GoRouterState state, Widget child) =>
                    Base(child: child),
            routes: $appRoutes)
      ]);
}

@TypedGoRoute<HomeRoutes>(path: Routes.home, routes: [
  TypedGoRoute<PostsRoute>(path: Routes.posts),
  TypedGoRoute<CommentsRoute>(path: Routes.comments),
  TypedGoRoute<AlbumsRoute>(path: Routes.albums),
  TypedGoRoute<PhotosRoute>(path: Routes.photos),
  TypedGoRoute<TodosRoute>(path: Routes.todos),
  TypedGoRoute<UsersRoute>(path: Routes.users),
])
class HomeRoutes extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      noneTransitionPage(child: const Home());
}

class PostsRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      noneTransitionPage(child: const Posts());
}

class CommentsRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      noneTransitionPage(child: const Comments());
}

class AlbumsRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      noneTransitionPage(child: const Albums());
}

class PhotosRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      noneTransitionPage(child: const Photos());
}

class TodosRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      noneTransitionPage(child: const Todos());
}

class UsersRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      noneTransitionPage(child: const Users());
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
