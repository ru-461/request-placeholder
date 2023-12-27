import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/components/user_view.dart';
import 'package:request_placeholder/models/user.dart';
import 'package:request_placeholder/providers/users_provider.dart';

final logger = Logger();

class Users extends ConsumerWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
        child: RefreshIndicator(
      onRefresh: () async => ref.refresh(usersProvider),
      child: FutureBuilder(
          future: ref.watch(usersProvider.future),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // 待機中
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // エラー
              return const Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Error.'),
                    ]),
              );
            } else {
              // 成功時
              final data = snapshot.data;

              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    User user = data[index];
                    return UserView(user: user);
                  });
            }
          }),
    ));
  }
}
