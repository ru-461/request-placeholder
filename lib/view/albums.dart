import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/repository/albums_repository.dart';

final logger = Logger();

class Albums extends StatefulWidget {
  const Albums({super.key});

  @override
  State<Albums> createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  final _repository = AlbumsRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _repository.fetchAlbums(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // データあり
                final data = snapshot.data;
                return ListView.builder(itemBuilder: (context, index) {
                  return ListTile(title: Text(data![index].title));
                });
              } else if (snapshot.hasError) {
                // エラ-
                return const Center(child: Text('Fetch faild.'));
              } else {
                // データなし
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
