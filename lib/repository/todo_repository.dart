import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:request_placeholder/constant/url.dart';
import 'package:request_placeholder/model/todos.dart';

// ロガー
final logger = Logger();

class TodosRepository {
  Future<List<Todos>> fetchTodos() async {
    // URL
    Uri url = Uri.parse(URL.todos);

    // GETリクエスト
    final http.Response response = await http.get(url);

    // ステータスコード確認
    if (response.statusCode == 200) {
      return compute(parseTodos, response.body);
    } else {
      throw Exception('Failed to fetch Todos');
    }
  }

  // List<Todos>に変換
  List<Todos> parseTodos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Todos>((json) => Todos.fromJson(json)).toList();
  }
}
