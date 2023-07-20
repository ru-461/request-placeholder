import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/components/album_view.dart';
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
    return Center(
        child: RefreshIndicator(
      onRefresh: () async {
        // 再フェッチ
        futureAlubums = _repository.fetchAlbums();
        setState(() {});
      },
      child: FutureBuilder(
          future: futureAlubums,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // 待機中
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // エラー
              return const Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error.'),
                    ]),
              );
            } else {
              // 成功時
              final data = snapshot.data;

              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Album album = data![index];
                    return AlbumView(album: album);
                  });
            }
          }),
    ));
  }
}
