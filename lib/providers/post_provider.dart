import 'package:request_placeholder/models/post.dart';
import 'package:request_placeholder/repository/post_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_provider.g.dart';

@riverpod
Future<Post> post(PostRef ref, int id) {
  final postRepository = PostRepository();
  return postRepository.fetchPost(id);
}
