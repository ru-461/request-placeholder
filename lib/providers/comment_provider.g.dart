// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$commentHash() => r'dbdfc3820991d151065d874caa812657753ceb43';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [comment].
@ProviderFor(comment)
const commentProvider = CommentFamily();

/// See also [comment].
class CommentFamily extends Family<AsyncValue<Comment>> {
  /// See also [comment].
  const CommentFamily();

  /// See also [comment].
  CommentProvider call(
    int id,
  ) {
    return CommentProvider(
      id,
    );
  }

  @override
  CommentProvider getProviderOverride(
    covariant CommentProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'commentProvider';
}

/// See also [comment].
class CommentProvider extends AutoDisposeFutureProvider<Comment> {
  /// See also [comment].
  CommentProvider(
    int id,
  ) : this._internal(
          (ref) => comment(
            ref as CommentRef,
            id,
          ),
          from: commentProvider,
          name: r'commentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commentHash,
          dependencies: CommentFamily._dependencies,
          allTransitiveDependencies: CommentFamily._allTransitiveDependencies,
          id: id,
        );

  CommentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Comment> Function(CommentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CommentProvider._internal(
        (ref) => create(ref as CommentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Comment> createElement() {
    return _CommentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommentProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CommentRef on AutoDisposeFutureProviderRef<Comment> {
  /// The parameter `id` of this provider.
  int get id;
}

class _CommentProviderElement extends AutoDisposeFutureProviderElement<Comment>
    with CommentRef {
  _CommentProviderElement(super.provider);

  @override
  int get id => (origin as CommentProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
