class SignUpModel {
  final String fullName;
  final String email;
  final String password;
  final String timezone;

  SignUpModel({
    required this.email,
    required this.password,
    required this.fullName,
    required this.timezone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'firstName': fullName,
      'timezone': timezone,
    };
  }
}
