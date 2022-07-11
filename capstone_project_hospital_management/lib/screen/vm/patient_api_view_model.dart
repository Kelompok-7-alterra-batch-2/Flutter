import 'package:capstone_project_hospital_management/model/outpatient_model.dart';
// ignore: unused_import
import 'package:capstone_project_hospital_management/model/patient.dart';
import 'package:capstone_project_hospital_management/services/API/patient_api_service.dart';

class PatientAPIVM {
  Future<List<OutpatientModel>> getPatients() async {
    return await PatientVM().fetchDataOutpatient();
  }

  Future<List<OutpatientModel>> getPatientsAuth(String token) async {
    return await PatientVM().fetchDataOutpatientAuth(token);
  }

  Future<List<Doctor>> getDoctorAuth(String token) async {
    return await PatientVM().fetchDataDoctorAuth(token);
  }

  Future<void> updateOutpatientToProcess(int? id) async {
    return await PatientVM().updateDiagnoseToProcess(id);
  }

  Future<void> updateOutpatientToProcessAuth(int? id, String token) async {
    return await PatientVM().updateDiagnoseToProcessAuth(id, token);
  }

  Future<void> updateOutpatientToDone(int? id) async {
    return await PatientVM().updateDiagnoseToDone(id);
  }

  Future<void> updateOutpatientToDoneAuth(int? id, String token) async {
    return await PatientVM().updateDiagnoseToDoneAuth(id, token);
  }

  Future<void> updateOutpatientDiagnose(
    int? id, {
    String diagnose = "",
    String prescription = "",
  }) async {
    return await PatientVM()
        .updateDiagnosePrescription(id, diagnose, prescription);
  }

  Future<void> updateOutpatientDiagnoseAuth(
    int? id, {
    required String token,
    String diagnose = "",
    String prescription = "",
  }) async {
    return await PatientVM()
        .updateDiagnosePrescriptionAuth(id, token, diagnose, prescription);
  }
}
