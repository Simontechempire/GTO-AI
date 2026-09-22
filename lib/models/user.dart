class User {
  final String id;
  final String name;
  final String email;
  final String? photoUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? 'GTO User',
      email: json['email'] ?? '',
      photoUrl: json['photoUrl'],
    );
  }
}
