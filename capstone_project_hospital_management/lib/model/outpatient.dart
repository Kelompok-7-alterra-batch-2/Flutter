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
        ? Department.fromJson(json['department'])
        : null;
    outpatientCondition = json['outpatientCondition'] != null
        ? OutpatientCondition.fromJson(json['outpatientCondition'])
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (department != null) {
      data['department'] = department!.toJson();
    }
    if (outpatientCondition != null) {
      data['outpatientCondition'] = outpatientCondition!.toJson();
    }
    data['diagnosis'] = diagnosis ?? "";
    data['prescription'] = prescription ?? "";
    data['medicalRecord'] = medicalRecord;
    data['appointmentReason'] = appointmentReason;
    data['dokter'] = dokter;
    data['queue'] = queue;
    data['date'] = date;
    data['arrivalTime'] = arrivalTime;
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
