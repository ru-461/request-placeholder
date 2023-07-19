import 'package:freezed_annotation/freezed_annotation.dart';

part 'users.freezed.dart';
part 'users.g.dart';

@freezed
class Users with _$Users {
  factory Users(
      {required int id,
      required String name,
      required String username,
      required String email,
      required String address,
      required String phone,
      required String website,
      required String company}) = _Users;

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
}
