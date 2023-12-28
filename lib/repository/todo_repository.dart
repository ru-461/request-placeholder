import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:request_placeholder/constants/url.dart';
import 'package:request_placeholder/models/todo.dart';

// ロガー
final logger = Logger();

class TodoRepository {
  Future<List<Todo>> fetchTodos() async {
    // URL
    Uri url = Uri.parse(URL.todos);

    // GETリクエスト
    final http.Response response = await http.get(url);

    // ステータスコード確認
    if (response.statusCode == 200) {
      return compute(parseTodos, response.body);
    } else {
      throw Exception('Failed to fetch Todos.');
    }
  }

  // List<Todo>に変換
  List<Todo> parseTodos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Todo>((json) => Todo.fromJson(json)).toList();
  }

  Future<Todo> fetchTodo(int id) async {
    // URL
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/todos/$id');

    // GETリクエスト
    final http.Response response = await http.get(url);

    // ステータスコード確認
    if (response.statusCode == 200) {
      return compute(parseTodo, response.body);
    } else {
      throw Exception('Failed to fetch Albums.');
    }
  }

  // Todoに変換
  Todo parseTodo(String responseBody) {
    final parsed = jsonDecode(responseBody);
    return Todo.fromJson(parsed);
  }
}
