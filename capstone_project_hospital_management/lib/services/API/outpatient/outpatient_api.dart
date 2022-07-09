import 'package:capstone_project_hospital_management/model/outpatient_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class OutpatientApiRepository {
  final Dio _dio = Dio();

  Future<Either<String, List<OutpatientModel>>> fetchDataOutpatient() async {
    Response _response;
    try {
      _response = await Dio()
          .get('https://capstone-project-hospital.herokuapp.com/outpatients');

      debugPrint("${_response.statusCode}");
      final List<OutpatientModel> _listOutpatient = (_response.data as List)
          .map((e) => OutpatientModel.fromJson(e))
          .toList();
      return right(_listOutpatient);
    } on DioError catch (e) {
      print(e.response!.statusCode);
      String errorMessage = e.response!.data.toString();
      switch (e.type) {
        case DioErrorType.connectTimeout:
          break;
        case DioErrorType.sendTimeout:
          break;
        case DioErrorType.receiveTimeout:
          break;
        case DioErrorType.response:
          errorMessage = e.response!.data['error'];
          break;
        case DioErrorType.cancel:
          break;
        case DioErrorType.other:
          break;
      }
      return left(errorMessage);
    }
  }
}
