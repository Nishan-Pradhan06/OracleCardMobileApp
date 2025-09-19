import 'dart:convert';

class LoginModel {
  final String identifier;
  final String password;

  LoginModel({required this.identifier, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'identifier': identifier, 'password': password};
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      identifier: map['identifier'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
