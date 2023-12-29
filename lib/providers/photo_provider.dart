import 'package:request_placeholder/models/photo.dart';
import 'package:request_placeholder/repository/photo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photo_provider.g.dart';

@riverpod
Future<Photo> photo(PhotoRef ref, int id) {
  final photoRepository = PhotoRepository();
  return photoRepository.fetchPhoto(id);
}
