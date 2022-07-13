// ignore_for_file: avoid_print, unused_local_variable

import 'package:capstone_project_hospital_management/model/doctor_model.dart';
import 'package:capstone_project_hospital_management/model/outpatient_model.dart';
import 'package:dio/dio.dart';

class PatientVM {
  var dio = Dio();

  Future<List<OutpatientModel>> fetchDataOutpatient() async {
    try {
      Response response = await Dio()
          .get('https://capstone-project-hospital.herokuapp.com/outpatients');

      print(response.statusCode);
      final List<OutpatientModel> _listOutpatient = (response.data as List)
          .map((e) => OutpatientModel.fromJson(e))
          .toList();
      return _listOutpatient;
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        print("error : ${e.response!.statusCode}");
        return [];
      }
      print("something wrong");
      print(e);
      return [];
    }
  }

  Future<List<OutpatientModel>> fetchDataOutpatientAuth(String token) async {
    try {
      Response response = await Dio().get(
        'https://capstone-postgres-hospital.herokuapp.com/outpatients',
        options: Options(
          headers: {"authorization": "Bearer $token"},
        ),
      );

      print("Success access : ${response.statusCode}");
      final List<OutpatientModel> _listOutpatient = (response.data as List)
          .map((e) => OutpatientModel.fromJson(e))
          .toList();
      return _listOutpatient;
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        print("error : ${e.response!.statusCode}");
        return [];
      } else if (e.response!.statusCode == 403) {
        print("error : ${e.response!.statusCode}, token is invalid now");
      }
      print("something wrong");
      print(e);
      return [];
    }
  }

  Future<List<OutpatientModel>> fetchDataOutpatientIdAuth(
      String token, int id) async {
    try {
      Response response = await Dio().get(
        'https://capstone-postgres-hospital.herokuapp.com/outpatients/$id',
        options: Options(
          headers: {"authorization": "Bearer $token"},
        ),
      );

      print("Success access : ${response.statusCode}");

      final List<OutpatientModel> _listOutpatient = [];
      _listOutpatient.add(OutpatientModel.fromJson(response.data));
      return _listOutpatient;
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        print("error : ${e.response!.statusCode}");
        return [];
      } else if (e.response!.statusCode == 403) {
        print("error : ${e.response!.statusCode}, token is invalid now");
        return [];
      } else if (e.response!.statusCode == 404) {
        print("not found");
        return [];
      }
      print("something wrong");
      print(e);
      return [];
    }
  }

  Future<List<Doctor>> fetchDataDoctorAuth(String token) async {
    try {
      Response response = await Dio().get(
        'https://capstone-postgres-hospital.herokuapp.com/doctors',
        options: Options(
          headers: {"authorization": "Bearer $token"},
        ),
      );

      print("Success access : ${response.statusCode}");
      final List<Doctor> _listOutpatient =
          (response.data as List).map((e) => Doctor.fromJson(e)).toList();
      return _listOutpatient;
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        print("error : ${e.response!.statusCode}");
        return [];
      } else if (e.response!.statusCode == 403) {
        print("error : ${e.response!.statusCode}, token is invalid now");
      }
      print("something wrong");
      print(e);
      return [];
    }
  }

  Future<DoctorModel> fetchDataDoctorEmailAuth(
    String token,
    String email,
  ) async {
    try {
      Response response = await Dio().get(
        'https://capstone-postgres-hospital.herokuapp.com/doctors/emails?email=$email',
        options: Options(
          headers: {"authorization": "Bearer $token"},
        ),
      );

      print("Success access : ${response.statusCode}");

      // final List<Doctor> _listOutpatient =
      // (response.data as List).map((e) => Doctor.fromJson(e)).toList();
      // final DoctorModel _doctor = response.data;

      // final DoctorModel _doctor = DoctorModel.fromJson(response.extra);
      final DoctorModel _doctor =
          DoctorModel.fromJson(Map<String, dynamic>.from(response.data));
      return _doctor;
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        print("error : ${e.response!.statusCode}");
        return DoctorModel();
      } else if (e.response!.statusCode == 403) {
        print("error : ${e.response!.statusCode}, token is invalid now");
      }
      print("something wrong");
      print(e);
      return DoctorModel();
    }
  }

  Future<void> updateDiagnoseToProcess(int? id) async {
    try {
      Response response = await Dio().put(
          "https://capstone-project-hospital.herokuapp.com/outpatients/process/$id");
      print("status outpatient has changed to process");
    } on DioError catch (e) {
      print("Something wrong on put : $e");
    }
  }

  Future<void> updateDiagnoseToProcessAuth(int? id, String token) async {
    try {
      Response response = await Dio().put(
        "https://capstone-postgres-hospital.herokuapp.com/outpatients/process/$id",
        options: Options(
          headers: {"authorization": "Bearer $token"},
        ),
      );
      print("status outpatient has changed to process");
    } on DioError catch (e) {
      print("Something wrong on put : $e");
    }
  }

  Future<void> updateDiagnoseToDone(int? id) async {
    try {
      Response response = await Dio().put(
          "https://capstone-project-hospital.herokuapp.com/outpatients/done/$id");
      print("status outpatient has changed to done");
    } on DioError catch (e) {
      print("Something wrong on put : $e");
    }
  }

  Future<void> updateDiagnoseToDoneAuth(int? id, String token) async {
    try {
      Response response = await Dio().put(
        "https://capstone-postgres-hospital.herokuapp.com/outpatients/done/$id",
        options: Options(
          headers: {"authorization": "Bearer $token"},
        ),
      );
      print("status outpatient has changed to done");
    } on DioError catch (e) {
      print("Something wrong on put : $e");
    }
  }

  Future<void> updateDiagnosePrescription(
    int? id,
    String diagnose,
    String prescription,
  ) async {
    try {
      Response response = await Dio().put(
        "https://capstone-project-hospital.herokuapp.com/outpatients/diagnosis/$id",
        data: {
          "diagnosis": diagnose,
          "prescription": prescription,
        },
      );
    } on DioError catch (e) {
      print("Something wrong on update diagnose: $e ");
    }
  }

  Future<void> updateDiagnosePrescriptionAuth(
    int? id,
    String token,
    String diagnose,
    String prescription,
  ) async {
    try {
      Response response = await Dio().put(
        "https://capstone-postgres-hospital.herokuapp.com/outpatients/diagnosis/$id",
        data: {
          "diagnosis": diagnose,
          "prescription": prescription,
        },
        options: Options(
          headers: {"authorization": "Bearer $token"},
        ),
      );
    } on DioError catch (e) {
      print("Something wrong on update diagnose: $e ");
    }
  }
}
