class MockPatient {
  final int? id;
  final String name;
  DateTime doB = DateTime.now();
  final String address;
  final String gender;
  String diagnosis;
  String prescription;

  MockPatient({
    this.id,
    required this.name,
    required this.doB,
    required this.address,
    required this.gender,
    required this.diagnosis,
    required this.prescription,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "doB": doB.millisecondsSinceEpoch,
      "address": address,
      "gender": gender,
      "diagnosis": diagnosis,
      "prescription": prescription,
    };
  }

  factory MockPatient.fromMap(Map<String, dynamic> map) {
    return MockPatient(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? "",
      doB: DateTime.fromMillisecondsSinceEpoch(map['doB'] ?? DateTime.now()),
      address: map['address'] ?? "",
      gender: map['gender'] ?? "",
      diagnosis: map['diagnosis'] ?? "",
      prescription: map['prescription'] ?? "",
    );
  }

  @override
  String toString() {
    return "MockPatient(id: $id,\nname: $name,\ndiagnose : $diagnosis,\nprescription : $prescription)";
  }
}
