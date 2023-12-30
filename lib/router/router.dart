import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:request_placeholder/constants/routes.dart';
import 'package:request_placeholder/views/album.dart';
import 'package:request_placeholder/views/albums.dart';
import 'package:request_placeholder/views/base.dart';
import 'package:request_placeholder/views/comment.dart';
import 'package:request_placeholder/views/comments.dart';
import 'package:request_placeholder/views/error.dart';
import 'package:request_placeholder/views/home.dart';
import 'package:request_placeholder/views/photo.dart';
import 'package:request_placeholder/views/photos.dart';
import 'package:request_placeholder/views/post.dart';
import 'package:request_placeholder/views/posts.dart';
import 'package:request_placeholder/views/todo.dart';
import 'package:request_placeholder/views/todos.dart';
import 'package:request_placeholder/views/user.dart';
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

@TypedGoRoute<HomeRoutes>(path: ROUTES.home)
class HomeRoutes extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      noneTransitionPage(child: const Home());
}

@TypedGoRoute<PostsRoute>(path: ROUTES.posts, routes: [])
class PostsRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      noneTransitionPage(child: const Posts());
}

@TypedGoRoute<PostRoute>(path: ROUTES.post)
class PostRoute extends GoRouteData {
  const PostRoute({required this.id});
  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) => Post(id: id);
}

@TypedGoRoute<CommentsRoute>(path: ROUTES.comments)
class CommentsRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      noneTransitionPage(child: const Comments());
}

@TypedGoRoute<CommentRoute>(path: ROUTES.comment)
class CommentRoute extends GoRouteData {
  const CommentRoute({required this.id});
  final int id;

  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      noneTransitionPage(child: Comment(id: id));
}

@TypedGoRoute<AlbumsRoute>(path: ROUTES.albums)
class AlbumsRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      noneTransitionPage(child: const Albums());
}

@TypedGoRoute<AlbumRoute>(path: ROUTES.album)
class AlbumRoute extends GoRouteData {
  const AlbumRoute({required this.id});
  final int id;

  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      noneTransitionPage(child: Album(id: id));
}

@TypedGoRoute<PhotosRoute>(path: ROUTES.photos)
class PhotosRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      noneTransitionPage(child: const Photos());
}

@TypedGoRoute<PhotoRoute>(path: ROUTES.photo)
class PhotoRoute extends GoRouteData {
  const PhotoRoute({required this.id});
  final int id;

  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      noneTransitionPage(child: Photo(id: id));
}

@TypedGoRoute<TodosRoute>(path: ROUTES.todos)
class TodosRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      noneTransitionPage(child: const Todos());
}

@TypedGoRoute<TodoRoute>(path: ROUTES.todo)
class TodoRoute extends GoRouteData {
  const TodoRoute({required this.id});
  final int id;

  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      noneTransitionPage(child: Todo(id: id));
}

@TypedGoRoute<UsersRoute>(path: ROUTES.users)
class UsersRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      noneTransitionPage(child: const Users());
}

@TypedGoRoute<UserRoute>(path: ROUTES.user)
class UserRoute extends GoRouteData {
  const UserRoute({required this.id});
  final int id;

  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      noneTransitionPage(child: User(id: id));
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
