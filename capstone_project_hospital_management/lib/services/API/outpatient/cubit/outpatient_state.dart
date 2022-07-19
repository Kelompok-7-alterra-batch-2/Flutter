part of 'outpatient_cubit.dart';

@immutable
abstract class OutpatientState {}

class OutpatientInitial extends OutpatientState {}

class OutpatientLoading extends OutpatientState {}

class OutpatientError extends OutpatientState {
  final String errorMessage;
  OutpatientError(this.errorMessage);
}

class OutpatientSuccess extends OutpatientState {
  final List<OutpatientModel> outpatientList;

  OutpatientSuccess(this.outpatientList);
}
