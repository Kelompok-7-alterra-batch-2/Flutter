class LoginRespond {
  String? token;
  String? message;
  String? role;
  String? email;

  LoginRespond({this.token, this.message, this.role, this.email});

  LoginRespond.fromJson(Map<String, dynamic> json) {
    token = json['token'] ?? '';
    message = json['message'] ?? '';
    role = json['role'] ?? '';
    email = json['email'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['message'] = message;
    data['role'] = role;
    data['email'] = email;
    return data;
  }
}
