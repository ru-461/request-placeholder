import 'package:request_placeholder/models/user.dart';
import 'package:request_placeholder/repository/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_provider.g.dart';

@riverpod
Future<List<User>> users(UsersRef ref) {
  final userRepository = UserRepository();
  return userRepository.fetchUsers();
}
