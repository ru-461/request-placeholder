class Posts {
  final int userId;
  final int id;
  final String body;

  Posts({required this.userId, required this.id, required this.body});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
        userId: json['userId'] as int,
        id: json['id'] as int,
        body: json['body'] as String);
  }
}
