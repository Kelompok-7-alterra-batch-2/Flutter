class LoginRespond {
  String? token;
  String? message;
  String? role;

  LoginRespond({
    this.token,
    this.message,
    this.role,
  });

  LoginRespond.fromJson(Map<String, dynamic> json) {
    token = json['token'] ?? '';
    message = json['message'] ?? '';
    role = json['role'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['message'] = message;
    data['role'] = role;
    return data;
  }
}
