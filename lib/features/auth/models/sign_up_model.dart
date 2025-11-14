class SignUpModel {
  final String name;
  final String email;
  final String password;
  final String timezone;

  SignUpModel({
    required this.email,
    required this.password,
    required this.name,
    required this.timezone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'name': name,
      'timezone': timezone,
    };
  }
}
