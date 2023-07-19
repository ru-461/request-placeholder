import 'package:freezed_annotation/freezed_annotation.dart';

part 'photos.freezed.dart';
part 'photos.g.dart';

@freezed
class Photos with _$Photos {
  factory Photos(
      {required int albumId,
      required int id,
      required String title,
      required String url,
      required String thumbnailUrl}) = _Photos;

  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);
}
