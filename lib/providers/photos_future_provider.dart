import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:request_placeholder/models/photo.dart';
import 'package:request_placeholder/repository/photo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photos_future_provider.g.dart';

@riverpod
Future<List<Photo>> photosFutureProvider(Ref ref) {
  final repository = PhotoRepository();
  return repository.fetchPhotos();
}
