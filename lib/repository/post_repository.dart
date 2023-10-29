import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:request_placeholder/constants/url.dart';
import 'package:request_placeholder/models/post.dart';

final logger = Logger();

class PostRepository {
  Future<List<Post>> fetchPosts() async {
    // URL
    Uri url = Uri.parse(URL.posts);

    // GETリクエスト
    final http.Response response = await http.get(url);

    // ステータスコード確認
    if (response.statusCode == 200) {
      return compute(parsePosts, response.body);
    } else {
      throw Exception('Failed to fetch Posts.');
    }
  }

  // List<Post>に変換
  List<Post> parsePosts(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  }
}
