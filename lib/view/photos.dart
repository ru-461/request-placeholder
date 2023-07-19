import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/repository/photos_repository.dart';

final logger = Logger();

class Photos extends StatefulWidget {
  const Photos({super.key});

  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  final _repository = PhotosRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _repository.fetchPhotos(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // データあり
                // final data = snapshot.data;
                return ListView.builder(itemBuilder: (context, index) {
                  return const ListTile(title: Text(''));
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
