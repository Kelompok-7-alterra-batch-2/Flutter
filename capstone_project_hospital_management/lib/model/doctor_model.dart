// ignore_for_file: prefer_void_to_null, unnecessary_question_mark

class Doctor {
  int? id;
  String? name;
  String? dob;
  String? email;
  String? availableFrom;
  String? availableTo;
  Department? department;
  Department? role;
  String? nid;
  String? phoneNumber;
  Null? outpatient;
  String? createdAt;

  Doctor(
      {this.id,
      this.name,
      this.dob,
      this.email,
      this.availableFrom,
      this.availableTo,
      this.department,
      this.role,
      this.nid,
      this.phoneNumber,
      this.outpatient,
      this.createdAt});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dob = json['dob'];
    email = json['email'];
    availableFrom = json['availableFrom'];
    availableTo = json['availableTo'];
    department = json['department'] != null
        ? Department.fromJson(json['department'])
        : null;
    role = json['role'] != null ? Department.fromJson(json['role']) : null;
    nid = json['nid'];
    phoneNumber = json['phoneNumber'];
    outpatient = json['outpatient'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['dob'] = dob;
    data['email'] = email;
    data['availableFrom'] = availableFrom;
    data['availableTo'] = availableTo;
    if (department != null) {
      data['department'] = department!.toJson();
    }
    if (role != null) {
      data['role'] = role!.toJson();
    }
    data['nid'] = nid;
    data['phoneNumber'] = phoneNumber;
    data['outpatient'] = outpatient;
    data['createdAt'] = createdAt;
    return data;
  }
}

class Department {
  int? id;
  String? name;
  String? createdAt;

  Department({this.id, this.name, this.createdAt});

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['createdAt'] = createdAt;
    return data;
  }
}
