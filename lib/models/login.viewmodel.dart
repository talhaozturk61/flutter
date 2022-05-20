import 'dart:convert';

class LoginViewModel {
  String? userName;
  String? password;
  LoginViewModel({
    this.userName,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': userName,
      'password': password,
    };
  }

  factory LoginViewModel.fromMap(Map<String, dynamic> map) {
    return LoginViewModel(
      userName: map['username'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginViewModel.fromJson(String source) =>
      LoginViewModel.fromMap(json.decode(source));
}
