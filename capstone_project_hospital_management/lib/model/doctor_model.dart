class DoctorModel {
  int? id;
  String? name;
  String? dob;
  String? password;
  String? email;
  String? nid;
  String? phoneNumber;
  String? username;

  DoctorModel(
      {this.id,
      this.name,
      this.dob,
      this.password,
      this.email,
      this.nid,
      this.phoneNumber,
      this.username});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "unknown";
    dob = json['dob'] ?? "2000-12-10";
    password = json['password'] ?? "unknown";
    email = json['email'] ?? "unknown";
    nid = json['nid'] ?? "666666";
    phoneNumber = json['phoneNumber'] ?? "085222229999";
    username = json['username'] ?? "username";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['dob'] = dob;
    data['password'] = password;
    data['email'] = email;
    data['nid'] = nid;
    data['phoneNumber'] = phoneNumber;
    data['username'] = username;
    return data;
  }
}
