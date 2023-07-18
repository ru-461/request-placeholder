import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:request_placeholder/constant/url.dart';
import 'package:request_placeholder/model/posts.dart';

final logger = Logger();

class PostsRepository {
  Future<List<Posts>> fetchPosts() async {
    // URL
    Uri url = Uri.parse(URL.posts);

    // GETリクエスト
    final http.Response response = await http.get(url);

    // ステータスコード確認
    if (response.statusCode == 200) {
      return compute(parsePosts, response.body);
    } else {
      throw Exception('Failed to fetch Posts');
    }
  }

  // List<Posts>に変換
  List<Posts> parsePosts(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Posts>((json) => Posts.fromJson(json)).toList();
  }
}
