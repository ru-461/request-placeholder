import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/model/photo.dart';
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
    return Scaffold(
        body: Center(
            child: FutureBuilder(
                future: futurePhotos,
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
