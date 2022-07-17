import 'package:capstone_project_hospital_management/model/doctor_model.dart';
import 'package:capstone_project_hospital_management/model/outpatient_model.dart';
// ignore: unused_import
import 'package:capstone_project_hospital_management/model/patient.dart';
import 'package:capstone_project_hospital_management/services/API/patient_api_service.dart';

class PatientAPIVM {
  Future<List<OutpatientModel>> getPatientsAuth(String token) async {
    return await PatientVM().fetchDataOutpatientAuth(token);
  }

  Future<List<OutpatientModel>> getPatientsTodayAuth(String token) async {
    return await PatientVM().fetchDataOutpatientTodayAuth(token);
  }

  Future<int> getCountOutpatientsTodayAuth(String token) async {
    return await PatientVM().fetchCountOutpatientAuth(token);
  }

  Future<List<OutpatientModel>> getPatientsAuthComplex(
      String token, int id) async {
    if (id == 0) {
      // return await PatientVM().fetchDataOutpatientAuth(token);
      return await PatientVM().fetchDataOutpatientTodayAuth(token);
    }
    return await PatientVM().fetchDataOutpatientIdAuth(token, id);
  }

  Future<List<OutpatientModel>> getPatientsByNameAuthComplex(
      String token, String name) async {
    if (name.trim() == "") {
      // return await PatientVM().fetchDataOutpatientAuth(token);
      return await PatientVM().fetchDataOutpatientTodayAuth(token);
    }
    return await PatientVM().fetchDataOutpatientNameAuth(token, name.trim());
  }

  Future<DoctorModel> getDoctorByEmailAuth(String token, String email) async {
    return await PatientVM().fetchDataDoctorEmailAuth(token, email);
  }

  Future<void> updateOutpatientToProcessAuth(int? id, String token) async {
    return await PatientVM().updateDiagnoseToProcessAuth(id, token);
  }

  Future<void> updateOutpatientToDoneAuth(int? id, String token) async {
    return await PatientVM().updateDiagnoseToDoneAuth(id, token);
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
