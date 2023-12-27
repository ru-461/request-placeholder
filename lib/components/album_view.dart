import 'package:flutter/material.dart';
import 'package:request_placeholder/models/album.dart';

class AlbumView extends StatelessWidget {
  final Album album;
  const AlbumView({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
            elevation: 5,
            child: ListTile(
              title: Text(
                album.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  album.title,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ))
      ],
    );
  }
}
