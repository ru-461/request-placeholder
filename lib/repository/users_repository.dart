import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:request_placeholder/constant/url.dart';
import 'package:request_placeholder/model/users.dart';

final logger = Logger();

class UsersRepository {
  Future<List<Users>> fetchUsers() async {
    // URL
    Uri url = Uri.parse(URL.users);

    // GETリクエスト
    final http.Response response = await http.get(url);
    logger.d(response.body);
    // ステータスコード確認
    if (response.statusCode == 200) {
      return compute(parseUsers, response.body);
    } else {
      throw Exception('Failed to fetch Users');
    }
  }

  // List<Users>に変換
  List<Users> parseUsers(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Users>((json) => Users.fromJson(json)).toList();
  }
}
