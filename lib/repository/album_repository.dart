import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:request_placeholder/constants/url.dart';
import 'package:request_placeholder/models/album.dart';

final logger = Logger();

class AlbumRepository {
  Future<List<Album>> fetchAlbums() async {
    // URL
    final Uri url = Uri.parse(URL.albums);

    // GETリクエスト
    final http.Response response = await http.get(url);

    // ステータスコード確認
    if (response.statusCode == 200) {
      return compute(parseAlbums, response.body);
    } else {
      throw Exception('Failed to fetch Albums.');
    }
  }

  Future<Album> fetchAlbum(int id) async {
    // URL
    final Uri url = Uri.parse('${URL.albums}/$id');

    // GETリクエスト
    final http.Response response = await http.get(url);

    // ステータスコード確認
    if (response.statusCode == 200) {
      return compute(parseAlbum, response.body);
    } else {
      throw Exception('Failed to fetch Albums.');
    }
  }

  // List<Album>に変換
  List<Album> parseAlbums(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Album>((json) => Album.fromJson(json)).toList();
  }

  // Albumに変換
  Album parseAlbum(String responseBody) {
    final parsed = jsonDecode(responseBody);
    return Album.fromJson(parsed);
  }
}
