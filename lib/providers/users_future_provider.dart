import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:request_placeholder/models/user.dart';
import 'package:request_placeholder/repository/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_future_provider.g.dart';

@riverpod
Future<List<User>> usersFutureProvider(Ref ref) {
  final repository = UserRepository();
  return repository.fetchUsers();
}
