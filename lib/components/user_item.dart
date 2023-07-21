import 'package:flutter/material.dart';
import 'package:request_placeholder/models/user.dart';

class UserView extends StatelessWidget {
  final User user;
  const UserView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            user.name,
            style: const TextStyle(fontSize: 18),
          ),
          subtitle: Text(
            user.email,
            style: const TextStyle(fontSize: 14),
          ),
        ),
        const Divider()
      ],
    );
  }
}
