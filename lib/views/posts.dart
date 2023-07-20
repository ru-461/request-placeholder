import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/components/post_view.dart';
import 'package:request_placeholder/models/post.dart';
import 'package:request_placeholder/repository/posts_repository.dart';

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
        body: Center(
            child: FutureBuilder(
                future: futurePosts,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // データあり
                    final data = snapshot.data;
                    return ListView.builder(itemBuilder: (context, index) {
                      Post post = data![index];
                      return PostView(post: post);
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
