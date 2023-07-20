import 'package:flutter/material.dart';
import 'package:request_placeholder/models/photo.dart';

class PhotoView extends StatelessWidget {
  final Photo photo;
  const PhotoView({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(photo.thumbnailUrl),
        ),
        title: Text(
          photo.title,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      const Divider()
    ]);
  }
}
