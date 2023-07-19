class Albums {
  final int userId;
  final int id;
  final String title;

  Albums({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Albums.fromJson(Map<String, dynamic> json) {
    return Albums(
        userId: json['userId'] as int,
        id: json['id'] as int,
        title: json['title'] as String);
  }
}
