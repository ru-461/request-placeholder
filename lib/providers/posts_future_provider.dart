import 'package:request_placeholder/models/post.dart';
import 'package:request_placeholder/repository/post_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'posts_future_provider.g.dart';

@riverpod
Future<List<Post>> postsFutureProvider(PostsFutureProviderRef ref) {
  final postRepository = PostRepository();
  return postRepository.fetchPosts();
}
