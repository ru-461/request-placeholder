import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/components/post_item.dart';
import 'package:request_placeholder/models/post.dart';
import 'package:request_placeholder/repository/post_repository.dart';

final logger = Logger();

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  late Future<List<Post>> futurePosts;
  final _repository = PostRepository();

  @override
  void initState() {
    super.initState();
    // フェッチ
    futurePosts = _repository.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () async {
        // 再フェッチ
        futurePosts = _repository.fetchPosts();
        setState(() {});
      },
      child: FutureBuilder(
          future: futurePosts,
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
                  Text('Error'),
                ],
              ));
            } else {
              // 成功時
              final data = snapshot.data;

              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Post post = data[index];
                    return PostView(post: post);
                  });
            }
          }),
    ));
  }
}
