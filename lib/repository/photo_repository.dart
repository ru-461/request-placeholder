import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:request_placeholder/constants/url.dart';
import 'package:request_placeholder/models/photo.dart';

final logger = Logger();

class PhotoRepository {
  Future<List<Photo>> fetchPhotos() async {
    // URL
    Uri url = Uri.parse(URL.photos);

    // GETリクエスト
    final http.Response response = await http.get(url);

    // ステータスコード確認
    if (response.statusCode == 200) {
      return compute(parsePhotos, response.body);
    } else {
      throw Exception('Failed to fetch Photos.');
    }
  }

  Future<Photo> fetchPhoto(int id) async {
    // URL
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/photos/$id');

    // GETリクエスト
    final http.Response response = await http.get(url);

    // ステータスコード確認
    if (response.statusCode == 200) {
      return compute(parsePhoto, response.body);
    } else {
      throw Exception('Failed to fetch Albums.');
    }
  }

  // List<Photo>に変換
  List<Photo> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }

  // Photoに変換
  Photo parsePhoto(String responseBody) {
    final parsed = jsonDecode(responseBody);
    return Photo.fromJson(parsed);
  }
}
