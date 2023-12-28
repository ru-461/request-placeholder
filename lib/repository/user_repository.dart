import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:request_placeholder/constants/url.dart';
import 'package:request_placeholder/models/user.dart';

final logger = Logger();

class UserRepository {
  Future<List<User>> fetchUsers() async {
    // URL
    Uri url = Uri.parse(URL.users);

    // GETリクエスト
    final http.Response response = await http.get(url);
    // ステータスコード確認
    if (response.statusCode == 200) {
      return compute(parseUsers, response.body);
    } else {
      throw Exception('Failed to fetch Users.');
    }
  }

  // List<User>に変換
  List<User> parseUsers(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

  // Userに変換
  User parseUser(String responseBody) {
    final parsed = jsonDecode(responseBody);
    return User.fromJson(parsed);
  }
}
