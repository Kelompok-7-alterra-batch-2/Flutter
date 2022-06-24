class MockPatient {
  final int? id;
  final int idPatient;
  final String name;
  DateTime doB = DateTime.now();
  final String address;
  final String gender;
  String diagnosis;
  String prescription;
  bool isDone;

  MockPatient({
    this.id,
    required this.idPatient,
    required this.name,
    required this.doB,
    required this.address,
    required this.gender,
    required this.diagnosis,
    required this.prescription,
    this.isDone = false,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "idPatient": idPatient,
      "name": name,
      "doB": doB.millisecondsSinceEpoch,
      "address": address,
      "gender": gender,
      "diagnosis": diagnosis,
      "prescription": prescription,
      "isDone": isDone ? 1 : 0,
    };
  }

  factory MockPatient.fromMap(Map<String, dynamic> map) {
    return MockPatient(
      id: map['id']?.toInt() ?? 0,
      idPatient: map['idPatient']?.toInt() ?? 0,
      name: map['name'] ?? "",
      doB: DateTime.fromMillisecondsSinceEpoch(map['doB'] ?? DateTime.now()),
      address: map['address'] ?? "",
      gender: map['gender'] ?? "",
      diagnosis: map['diagnosis'] ?? "",
      prescription: map['prescription'] ?? "",
      isDone: (map['isDone'] ?? 0) == 1 ? true : false,
    );
  }

  @override
  String toString() {
    return "MockPatient(id: $id, id patient : $idPatient, name: $name,diagnose : $diagnosis,prescription : $prescription)";
  }
}
