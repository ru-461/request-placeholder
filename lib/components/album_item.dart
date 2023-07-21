import 'package:flutter/material.dart';
import 'package:request_placeholder/models/album.dart';

class AlbumView extends StatelessWidget {
  final Album album;
  const AlbumView({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            album.title,
            style: const TextStyle(fontSize: 18),
          ),
          subtitle: Text(
            album.title,
            style: const TextStyle(fontSize: 14),
          ),
        ),
        const Divider()
      ],
    );
  }
}
