import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:request_placeholder/constant/url.dart';
import 'package:request_placeholder/model/albums.dart';

final logger = Logger();

class AlbumsRepository {
  Future<List<Albums>> fetchAlbums() async {
    // URL
    Uri url = Uri.parse(URL.albums);

    // GETリクエスト
    final http.Response response = await http.get(url);

    // ステータスコード確認
    if (response.statusCode == 200) {
      logger.d(response.body);
      return compute(parseAlbums, response.body);
    } else {
      throw Exception('Failed to fetch Albums');
    }
  }

  // List<Albums>に変換
  List<Albums> parseAlbums(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Albums>((json) => Albums.fromJson(json)).toList();
  }
}
