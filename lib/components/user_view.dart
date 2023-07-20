import 'package:flutter/material.dart';
import 'package:request_placeholder/models/User.dart';

class UserView extends StatelessWidget {
  final User user;
  const UserView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(
          title: Text(
            '',
            style: TextStyle(fontSize: 10),
          ),
          subtitle: Text(
            '',
            style: TextStyle(fontSize: 15),
          ),
        ),
        Divider()
      ],
    );
  }
}
