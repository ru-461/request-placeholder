import 'package:freezed_annotation/freezed_annotation.dart';

part 'albums.freezed.dart';
part 'albums.g.dart';

@freezed
class Albums with _$Albums {
  factory Albums(
      {required int userId, required int id, required String title}) = _Albums;

  factory Albums.fromJson(Map<String, dynamic> json) => _$AlbumsFromJson(json);
}
