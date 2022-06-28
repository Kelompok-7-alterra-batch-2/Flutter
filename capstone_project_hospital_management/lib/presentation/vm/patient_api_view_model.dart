import 'package:capstone_project_hospital_management/model/outpatient_model.dart';
// ignore: unused_import
import 'package:capstone_project_hospital_management/model/patient.dart';
import 'package:capstone_project_hospital_management/services/API/patient_api_service.dart';

class PatientAPIVM {
  Future<List<OutpatientModel>> getPatients() async {
    return await PatientVM().fetchDataOutpatient();
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
