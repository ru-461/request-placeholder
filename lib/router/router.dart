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

@TypedGoRoute<HomeRoutes>(path: Routes.home)
class HomeRoutes extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const Home();
}

@TypedGoRoute<PostsRoute>(path: Routes.posts)
class PostsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const Posts();
}

@TypedGoRoute<CommentsRoute>(path: Routes.comments)
class CommentsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const Comments();
}

@TypedGoRoute<AlbumsRoute>(path: Routes.albums)
class AlbumsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const Albums();
}

@TypedGoRoute<PhotosRoute>(path: Routes.photos)
class PhotosRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const Photos();
}

@TypedGoRoute<UsersRoute>(path: Routes.users)
class UsersRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const Users();
}

@TypedGoRoute<TodosRoute>(path: Routes.todos)
class TodosRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const Todos();
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
