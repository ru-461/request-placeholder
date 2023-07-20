import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/components/photo_view.dart';
import 'package:request_placeholder/models/photo.dart';
import 'package:request_placeholder/repository/photo_repository.dart';

final logger = Logger();

class Photos extends StatefulWidget {
  const Photos({super.key});

  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  late Future<List<Photo>> futurePhotos;
  final _repository = PhotoRepository();

  @override
  void initState() {
    super.initState();
    // フェッチ
    futurePhotos = _repository.fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: RefreshIndicator(
      onRefresh: () async {
        // 再フェッチ
        futurePhotos = _repository.fetchPhotos();
        setState(() {});
      },
      child: FutureBuilder(
          future: futurePhotos,
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
