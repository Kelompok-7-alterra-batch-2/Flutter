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
        outpatient!.add(new Outpatient.fromJson(v));
      });
    }
    bloodType = json['bloodType'] != null
        ? new BloodType.fromJson(json['bloodType'])
        : null;
    gender =
        json['gender'] != null ? new BloodType.fromJson(json['gender']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['dob'] = this.dob;
    data['createdAt'] = this.createdAt;
    data['phoneNumber'] = this.phoneNumber;
    data['city'] = this.city;
    data['address'] = this.address;
    if (this.outpatient != null) {
      data['outpatient'] = this.outpatient!.map((v) => v.toJson()).toList();
    }
    if (this.bloodType != null) {
      data['bloodType'] = this.bloodType!.toJson();
    }
    if (this.gender != null) {
      data['gender'] = this.gender!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}
