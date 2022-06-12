import 'package:capstone_project_hospital_management/model/mock_patient.dart';
import 'package:capstone_project_hospital_management/services/database/mock_sqlite.dart';

class PatientVM {
  final DatabasePatient _databasePatient = DatabasePatient();

  Future<List<MockPatient>> getPatients() async {
    return await _databasePatient.patients();
  }

  Future<MockPatient> getPatient(int id) async {
    return await _databasePatient.certainPatient(id);
  }
}
