import 'dart:convert';

class User {
  final String? userName;
  final String? name;
  final String? token;
  final String? id;
  User({
    required this.userName,
    required this.name,
    required this.token,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'name': name,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userName: map['userName'],
      name: map['name'],
      token: map['token'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
