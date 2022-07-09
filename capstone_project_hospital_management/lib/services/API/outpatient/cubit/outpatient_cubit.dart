import 'package:bloc/bloc.dart';
import 'package:capstone_project_hospital_management/model/outpatient_model.dart';
import 'package:capstone_project_hospital_management/services/API/outpatient/outpatient_api.dart';
import 'package:meta/meta.dart';

part 'outpatient_state.dart';

class OutpatientCubit extends Cubit<OutpatientState> {
  OutpatientCubit() : super(OutpatientInitial());

  final OutpatientApiRepository _outpatientApiRepository =
      OutpatientApiRepository();
  void fetchOutpatient() async {
    emit(OutpatientLoading());

    try {
      final _data = await _outpatientApiRepository.fetchDataOutpatient();
      _data.fold(
        (l) => emit(OutpatientError(l)),
        (r) => emit(OutpatientSuccess(r)),
      );
    } catch (e) {
      emit(OutpatientError(e.toString()));
    }
  }
}
