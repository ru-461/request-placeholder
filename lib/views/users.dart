import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/models/user.dart';
import 'package:request_placeholder/repository/user_repository.dart';

final logger = Logger();

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  late Future<List<User>> futureUsers;
  final _repository = UserRepository();

  @override
  void initState() {
    super.initState();
    // フェッチ
    futureUsers = _repository.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: FutureBuilder(
                future: futureUsers,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    // データあり
                    // final data = snapshot.data;
                    return ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                      // final User user = data![index];
                      return const Text('');
                    });
                  } else if (snapshot.hasError) {
                    // エラ-
                    return const Text('Fetch faild.');
                  } else {
                    // データなし
                    return const CircularProgressIndicator();
                  }
                })));
  }
}
