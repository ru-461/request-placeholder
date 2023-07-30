import 'package:flutter/material.dart';
import 'package:request_placeholder/models/user.dart';

class UserView extends StatelessWidget {
  final User user;
  const UserView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            elevation: 5,
            child: ListTile(
              title: Text(
                user.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  user.email,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ))
      ],
    );
  }
}
