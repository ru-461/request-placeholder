import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:request_placeholder/components/comment_item.dart';
import 'package:request_placeholder/models/comment.dart';
import 'package:request_placeholder/providers/comments_future_provider.dart';

final logger = Logger();

class Comments extends ConsumerWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () async => ref.refresh(commentsFutureProviderProvider),
      child: FutureBuilder(
          future: ref.watch(commentsFutureProviderProvider.future),
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
                    Comment comment = data[index];
                    return CommentView(comment: comment);
                  });
            }
          }),
    ));
  }
}
