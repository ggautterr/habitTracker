class SignupLoginModel {
  final String email;
  final String password;

  SignupLoginModel({required this.email, required this.password});

  factory SignupLoginModel.fromJson(Map<String, dynamic> json) {
    return SignupLoginModel(email: json['email'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}
