import 'package:request_placeholder/models/comment.dart';
import 'package:request_placeholder/repository/comment_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comment_provider.g.dart';

@riverpod
Future<Comment> comment(CommentRef ref, int id) {
  final commentRepository = CommentRepository();
  return commentRepository.fetchComment(id);
}
