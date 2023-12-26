import 'package:request_placeholder/models/comment.dart';
import 'package:request_placeholder/repository/comment_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comments_provider.g.dart';

@riverpod
Future<List<Comment>> comments(CommentsRef ref) {
  final commentRepository = CommentRepository();
  return commentRepository.fetchComments();
}
