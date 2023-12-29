import 'package:request_placeholder/models/user.dart';
import 'package:request_placeholder/repository/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
Future<User> user(UserRef ref, int id) {
  final userRepository = UserRepository();
  return userRepository.fetchUser(id);
}
