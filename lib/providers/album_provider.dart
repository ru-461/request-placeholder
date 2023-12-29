import 'package:request_placeholder/models/album.dart';
import 'package:request_placeholder/repository/album_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'album_provider.g.dart';

@riverpod
Future<Album> album(AlbumRef ref, int id) {
  final albumRepository = AlbumRepository();
  return albumRepository.fetchAlbum(id);
}
