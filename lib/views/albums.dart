import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/models/album.dart';
import 'package:request_placeholder/repository/album_repository.dart';

final logger = Logger();

class Albums extends StatefulWidget {
  const Albums({super.key});

  @override
  State<Albums> createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  late Future<List<Album>> futureAlubums;
  final _repository = AlbumRepository();

  @override
  void initState() {
    super.initState();
    // フェッチ
    futureAlubums = _repository.fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: FutureBuilder(
                future: futureAlubums,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // データあり
                    final data = snapshot.data;
                    return ListView.builder(itemBuilder: (context, index) {
                      return ListTile(title: Text(data![index].title));
                    });
                  } else if (snapshot.hasError) {
                    // エラ-
                    return const Text('Fetch faild.');
                  } else {
                    // データなし
                    return const CircularProgressIndicator();
                  }
                })));
  }
}
