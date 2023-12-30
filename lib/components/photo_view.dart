import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:request_placeholder/models/photo.dart';

class PhotoView extends StatelessWidget {
  final Photo photo;
  const PhotoView({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    final int photoId = photo.id;

    return Column(children: <Widget>[
      Card(
          elevation: 5,
          child: InkWell(
            onTap: () => context.push('/photos/$photoId'),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(photo.thumbnailUrl),
              ),
              title: Text(
                photo.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ))
    ]);
  }
}
