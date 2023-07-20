import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/components/user_view.dart';
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
            child: RefreshIndicator(
      onRefresh: () async {
        // 再フェッチ
        futureUsers = _repository.fetchUsers();
        setState(() {});
      },
      child: FutureBuilder(
          future: futureUsers,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // 待機中
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // エラー
              return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error.'),
                  ]);
            } else {
              // 成功時
              final data = snapshot.data;

              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    User user = data![index];
                    return UserView(user: user);
                  });
            }
          }),
    )));
  }
}
