class Users {
  final int id;
  final String name;
  final String username;
  final String email;
  final String address;
  final String phone;
  final String website;
  final String company;

  Users(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        id: json['id'] as int,
        name: json['name'] as String,
        username: json['username'] as String,
        email: json['email'] as String,
        address: json['address'] as String,
        phone: json['phone'] as String,
        website: json['website'] as String,
        company: json['company'] as String);
  }
}
