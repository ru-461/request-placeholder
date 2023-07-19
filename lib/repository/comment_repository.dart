import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:request_placeholder/constant/url.dart';
import 'package:request_placeholder/model/comment.dart';

final logger = Logger();

class CommentRepository {
  Future<List<Comment>> fetchComments() async {
    // URL
    Uri url = Uri.parse(URL.comments);

    // GETリクエスト
    final http.Response response = await http.get(url);

    // ステータスコード確認
    if (response.statusCode == 200) {
      return compute(parseComments, response.body);
    } else {
      throw Exception('Failed to fetch Comments');
    }
  }

  // List<Comments>に変換
  List<Comment> parseComments(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Comment>((json) => Comment.fromJson(json)).toList();
  }
}
