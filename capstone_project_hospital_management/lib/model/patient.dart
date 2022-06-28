import 'package:capstone_project_hospital_management/model/outpatient.dart';

class Patient {
  int? id;
  String? name;
  String? dob;
  String? createdAt;
  String? phoneNumber;
  String? city;
  String? address;
  List<Outpatient>? outpatient;
  BloodType? bloodType;
  BloodType? gender;

  Patient(
      {this.id,
      this.name,
      this.dob,
      this.createdAt,
      this.phoneNumber,
      this.city,
      this.address,
      this.outpatient,
      this.bloodType,
      this.gender});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    dob = json['dob'];
    createdAt = json['createdAt'];
    phoneNumber = json['phoneNumber'];
    city = json['city'];
    address = json['address'];
    if (json['outpatient'] != null) {
      outpatient = <Outpatient>[];
      json['outpatient'].forEach((v) {
        outpatient!.add(Outpatient.fromJson(v));
      });
    }
    bloodType = json['bloodType'] != null
        ? BloodType.fromJson(json['bloodType'])
        : null;
    gender = json['gender'] != null ? BloodType.fromJson(json['gender']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['dob'] = dob;
    data['createdAt'] = createdAt;
    data['phoneNumber'] = phoneNumber;
    data['city'] = city;
    data['address'] = address;
    if (outpatient != null) {
      data['outpatient'] = outpatient!.map((v) => v.toJson()).toList();
    }
    if (bloodType != null) {
      data['bloodType'] = bloodType!.toJson();
    }
    if (gender != null) {
      data['gender'] = gender!.toJson();
    }
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
