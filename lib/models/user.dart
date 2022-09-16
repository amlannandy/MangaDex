class User {
  String id;
  String username;

  User({
    required this.id,
    required this.username,
  });

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(id: json['id'], username: json['attributes']['username']);
  }
}
