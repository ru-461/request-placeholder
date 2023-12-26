// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoutes,
    ];

RouteBase get $homeRoutes => GoRouteData.$route(
      path: '/',
      factory: $HomeRoutesExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/posts',
          factory: $PostsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/comments',
          factory: $CommentsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/albums',
          factory: $AlbumsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/photos',
          factory: $PhotosRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/todos',
          factory: $TodosRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/users',
          factory: $UsersRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRoutesExtension on HomeRoutes {
  static HomeRoutes _fromState(GoRouterState state) => HomeRoutes();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PostsRouteExtension on PostsRoute {
  static PostsRoute _fromState(GoRouterState state) => PostsRoute();

  String get location => GoRouteData.$location(
        '/posts',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CommentsRouteExtension on CommentsRoute {
  static CommentsRoute _fromState(GoRouterState state) => CommentsRoute();

  String get location => GoRouteData.$location(
        '/comments',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AlbumsRouteExtension on AlbumsRoute {
  static AlbumsRoute _fromState(GoRouterState state) => AlbumsRoute();

  String get location => GoRouteData.$location(
        '/albums',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PhotosRouteExtension on PhotosRoute {
  static PhotosRoute _fromState(GoRouterState state) => PhotosRoute();

  String get location => GoRouteData.$location(
        '/photos',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TodosRouteExtension on TodosRoute {
  static TodosRoute _fromState(GoRouterState state) => TodosRoute();

  String get location => GoRouteData.$location(
        '/todos',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $UsersRouteExtension on UsersRoute {
  static UsersRoute _fromState(GoRouterState state) => UsersRoute();

  String get location => GoRouteData.$location(
        '/users',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerHash() => r'6f582e9125cf515c2c434a92bed778b59c43d260';

/// See also [router].
@ProviderFor(router)
final routerProvider = AutoDisposeProvider<GoRouter>.internal(
  router,
  name: r'routerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RouterRef = AutoDisposeProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
