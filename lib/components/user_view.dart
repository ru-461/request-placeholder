import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/models/user.dart';

final logger = Logger();

class UserView extends StatelessWidget {
  final User user;
  const UserView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final int userId = user.id;

    return Column(children: <Widget>[
      GestureDetector(
          child: Card(
              elevation: 5,
              child: InkWell(
                onTap: () => context.push('/users/$userId'),
                child: ListTile(
                  title: Text(
                    user.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      user.email,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              )),
          onTap: () => logger.i(user.id))
    ]);
  }
}
