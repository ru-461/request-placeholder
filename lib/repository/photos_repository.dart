import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:request_placeholder/constant/url.dart';
import 'package:request_placeholder/model/Photos.dart';

final logger = Logger();

class PhotosRepository {
  Future<List<Photos>> fetchPhotos() async {
    // URL
    Uri url = Uri.parse(URL.photos);

    // GETリクエスト
    final http.Response response = await http.get(url);

    // ステータスコード確認
    if (response.statusCode == 200) {
      return compute(parsePhotos, response.body);
    } else {
      throw Exception('Failed to fetch Photos');
    }
  }

  // List<Photos>に変換
  List<Photos> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Photos>((json) => Photos.fromJson(json)).toList();
  }
}
