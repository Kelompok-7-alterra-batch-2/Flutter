class OutpatientModel {
  int? id;
  Patient? patient;
  Doctor? doctor;
  Department? department;
  OutpatientCondition? outpatientCondition;
  int? queue;
  String? appointmentReason;
  String? date;
  String? arrivalTime;
  String? diagnosis;
  String? prescription;
  String? createAt;

  OutpatientModel(
      {this.id,
      this.patient,
      this.doctor,
      this.department,
      this.outpatientCondition,
      this.queue,
      this.appointmentReason,
      this.date,
      this.arrivalTime,
      this.diagnosis,
      this.prescription,
      this.createAt});

  OutpatientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patient =
        json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    doctor = json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
    department = json['department'] != null
        ? Department.fromJson(json['department'])
        : null;
    outpatientCondition = json['outpatientCondition'] != null
        ? OutpatientCondition.fromJson(json['outpatientCondition'])
        : null;
    queue = json['queue'];
    appointmentReason = json['appointmentReason'];
    date = json['date'];
    arrivalTime = json['arrivalTime'];
    diagnosis = json['diagnosis'] ?? "";
    prescription = json['prescription'] ?? "";
    createAt = json['createAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (patient != null) {
      data['patient'] = patient!.toJson();
    }
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    if (department != null) {
      data['department'] = department!.toJson();
    }
    if (outpatientCondition != null) {
      data['outpatientCondition'] = outpatientCondition!.toJson();
    }
    data['queue'] = queue;
    data['appointmentReason'] = appointmentReason;
    data['date'] = date;
    data['arrivalTime'] = arrivalTime;
    data['diagnosis'] = diagnosis;
    data['prescription'] = prescription;
    data['createAt'] = createAt;
    return data;
  }
}

class Patient {
  int? id;
  String? name;
  String? dob;
  String? phoneNumber;
  String? city;
  String? address;
  BloodType? bloodType;
  BloodType? gender;
  String? createdAt;

  Patient(
      {this.id,
      this.name,
      this.dob,
      this.phoneNumber,
      this.city,
      this.address,
      this.bloodType,
      this.gender,
      this.createdAt});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dob = json['dob'];
    phoneNumber = json['phoneNumber'];
    city = json['city'];
    address = json['address'];
    bloodType = json['bloodType'] != null
        ? BloodType.fromJson(json['bloodType'])
        : null;
    gender = json['gender'] != null ? BloodType.fromJson(json['gender']) : null;
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['dob'] = dob;
    data['phoneNumber'] = phoneNumber;
    data['city'] = city;
    data['address'] = address;
    if (bloodType != null) {
      data['bloodType'] = bloodType!.toJson();
    }
    if (gender != null) {
      data['gender'] = gender!.toJson();
    }
    data['createdAt'] = createdAt;
    return data;
  }
}

class BloodType {
  int? id;
  String? type;

  BloodType({this.id, this.type});

  BloodType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    return data;
  }
}

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

class OutpatientCondition {
  int? id;
  String? conditions;
  String? createdAt;

  OutpatientCondition({this.id, this.conditions, this.createdAt});

  OutpatientCondition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    conditions = json['conditions'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['conditions'] = conditions;
    data['createdAt'] = createdAt;
    return data;
  }
}
