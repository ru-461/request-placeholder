import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/components/album_view.dart';
import 'package:request_placeholder/models/album.dart';
import 'package:request_placeholder/providers/albums_provider.dart';

final logger = Logger();

class Albums extends ConsumerWidget {
  const Albums({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
        child: RefreshIndicator(
      onRefresh: () async => ref.refresh(albumsProvider),
      child: FutureBuilder(
          future: ref.watch(albumsProvider.future),
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
                    Album album = data[index];
                    return AlbumView(album: album);
                  });
            }
          }),
    ));
  }
}
