class Outpatient {
  int? id;
  Department? department;
  OutpatientCondition? outpatientCondition;
  String? diagnosis;
  String? prescription;
  String? medicalRecord;
  String? appointmentReason;
  int? dokter;
  int? queue;
  String? date;
  String? arrivalTime;
  String? createdAt;

  Outpatient(
      {this.id,
      this.department,
      this.outpatientCondition,
      this.diagnosis,
      this.prescription,
      this.medicalRecord,
      this.appointmentReason,
      this.dokter,
      this.queue,
      this.date,
      this.arrivalTime,
      this.createdAt});

  Outpatient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    department = json['department'] != null
        ? new Department.fromJson(json['department'])
        : null;
    outpatientCondition = json['outpatientCondition'] != null
        ? new OutpatientCondition.fromJson(json['outpatientCondition'])
        : null;
    diagnosis = json['diagnosis'] ?? "";
    prescription = json['prescription'] ?? "";
    medicalRecord = json['medicalRecord'];
    appointmentReason = json['appointmentReason'];
    dokter = json['dokter'];
    queue = json['queue'];
    date = json['date'];
    arrivalTime = json['arrivalTime'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.department != null) {
      data['department'] = this.department!.toJson();
    }
    if (this.outpatientCondition != null) {
      data['outpatientCondition'] = this.outpatientCondition!.toJson();
    }
    data['diagnosis'] = this.diagnosis ?? "";
    data['prescription'] = this.prescription ?? "";
    data['medicalRecord'] = this.medicalRecord;
    data['appointmentReason'] = this.appointmentReason;
    data['dokter'] = this.dokter;
    data['queue'] = this.queue;
    data['date'] = this.date;
    data['arrivalTime'] = this.arrivalTime;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['conditions'] = this.conditions;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
