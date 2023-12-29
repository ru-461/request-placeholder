// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$photoHash() => r'cf8f1d1ef9b49ece1da971f0d08ee361e02f1df9';

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

/// See also [photo].
@ProviderFor(photo)
const photoProvider = PhotoFamily();

/// See also [photo].
class PhotoFamily extends Family<AsyncValue<Photo>> {
  /// See also [photo].
  const PhotoFamily();

  /// See also [photo].
  PhotoProvider call(
    int id,
  ) {
    return PhotoProvider(
      id,
    );
  }

  @override
  PhotoProvider getProviderOverride(
    covariant PhotoProvider provider,
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
  String? get name => r'photoProvider';
}

/// See also [photo].
class PhotoProvider extends AutoDisposeFutureProvider<Photo> {
  /// See also [photo].
  PhotoProvider(
    int id,
  ) : this._internal(
          (ref) => photo(
            ref as PhotoRef,
            id,
          ),
          from: photoProvider,
          name: r'photoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$photoHash,
          dependencies: PhotoFamily._dependencies,
          allTransitiveDependencies: PhotoFamily._allTransitiveDependencies,
          id: id,
        );

  PhotoProvider._internal(
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
    FutureOr<Photo> Function(PhotoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PhotoProvider._internal(
        (ref) => create(ref as PhotoRef),
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
  AutoDisposeFutureProviderElement<Photo> createElement() {
    return _PhotoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PhotoProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PhotoRef on AutoDisposeFutureProviderRef<Photo> {
  /// The parameter `id` of this provider.
  int get id;
}

class _PhotoProviderElement extends AutoDisposeFutureProviderElement<Photo>
    with PhotoRef {
  _PhotoProviderElement(super.provider);

  @override
  int get id => (origin as PhotoProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
