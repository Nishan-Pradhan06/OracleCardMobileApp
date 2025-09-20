class SignUpModel {
  final String fullName;
  final String email;
  final String password;
  final String timeZone;

  SignUpModel({
    required this.email,
    required this.password,
    required this.fullName,
    required this.timeZone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'firstName': fullName,
      'timeZone': timeZone,
    };
  }
}
