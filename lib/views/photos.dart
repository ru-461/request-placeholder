import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/components/photo_view.dart';
import 'package:request_placeholder/models/photo.dart';
import 'package:request_placeholder/providers/photos_provider.dart';

final logger = Logger();

class Photos extends ConsumerWidget {
  const Photos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
        child: RefreshIndicator(
      onRefresh: () async => ref.refresh(photosProvider),
      child: FutureBuilder(
          future: ref.watch(photosProvider.future),
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
                  ]));
            } else {
              // 成功時
              final data = snapshot.data;

              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Photo photo = data[index];
                    return PhotoView(photo: photo);
                  });
            }
          }),
    ));
  }
}
