// ignore_for_file: avoid_print, unused_local_variable

import 'package:capstone_project_hospital_management/model/outpatient_model.dart';
import 'package:dio/dio.dart';

class PatientVM {
  var dio = Dio();

  Future<List<OutpatientModel>> fetchDataOutpatient() async {
    try {
      Response response = await Dio().get(
          'https://capstone-project-hospital.herokuapp.com/outpatients/today');
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

  Future<void> updateDiagnoseToProcess(int? id) async {
    try {
      Response response = await Dio().put(
          "https://capstone-project-hospital.herokuapp.com/outpatients/process/$id");
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
}
