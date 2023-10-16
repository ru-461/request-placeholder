import 'package:request_placeholder/models/album.dart';
import 'package:request_placeholder/repository/album_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'albums_future_provider.g.dart';

@riverpod
Future<List<Album>> albumsFutureProvider(AlbumsFutureProviderRef ref) {
  final repository = AlbumRepository();
  return repository.fetchAlbums();
}
