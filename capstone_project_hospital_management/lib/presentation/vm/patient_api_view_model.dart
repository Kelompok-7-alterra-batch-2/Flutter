import 'package:capstone_project_hospital_management/model/patient.dart';
import 'package:capstone_project_hospital_management/services/API/patient_api_view_model.dart';

class PatientAPIVM {
  Future<List<Patient>> getPatients() async {
    return await PatientVM().fetchDataPatient();
  }

  Future<void> updateOutpatientToProcess(int? id) async {
    return await PatientVM().updateDiagnoseToProcess(id);
  }

  Future<void> updateOutpatientToDone(int? id) async {
    return await PatientVM().updateDiagnoseToDone(id);
  }

  Future<void> updateOutpatientDiagnose(
    int? id, {
    String diagnose = "",
    String prescription = "",
  }) async {
    return await PatientVM()
        .updateDiagnosePrescription(id, diagnose, prescription);
  }
}
