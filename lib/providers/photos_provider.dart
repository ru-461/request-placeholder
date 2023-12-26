import 'package:request_placeholder/models/photo.dart';
import 'package:request_placeholder/repository/photo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photos_provider.g.dart';

@riverpod
Future<List<Photo>> photos(PhotosRef ref) {
  final photoRepository = PhotoRepository();
  return photoRepository.fetchPhotos();
}
