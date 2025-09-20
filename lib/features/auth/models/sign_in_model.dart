import 'dart:convert';

class SignInModel {
  final String identifier;
  final String password;

  SignInModel({required this.identifier, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'identifier': identifier, 'password': password};
  }

  factory SignInModel.fromMap(Map<String, dynamic> map) {
    return SignInModel(
      identifier: map['identifier'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignInModel.fromJson(String source) =>
      SignInModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
