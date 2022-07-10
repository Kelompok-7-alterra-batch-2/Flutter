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
        ? new Department.fromJson(json['department'])
        : null;
    role = json['role'] != null ? new Department.fromJson(json['role']) : null;
    nid = json['nid'];
    phoneNumber = json['phoneNumber'];
    outpatient = json['outpatient'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['dob'] = this.dob;
    data['email'] = this.email;
    data['availableFrom'] = this.availableFrom;
    data['availableTo'] = this.availableTo;
    if (this.department != null) {
      data['department'] = this.department!.toJson();
    }
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    data['nid'] = this.nid;
    data['phoneNumber'] = this.phoneNumber;
    data['outpatient'] = this.outpatient;
    data['createdAt'] = this.createdAt;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
