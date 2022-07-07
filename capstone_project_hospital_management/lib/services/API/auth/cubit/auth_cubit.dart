import 'package:bloc/bloc.dart';
import 'package:capstone_project_hospital_management/services/API/auth/api_login.dart';
import 'package:capstone_project_hospital_management/services/API/auth/model/login_request.dart';
import 'package:capstone_project_hospital_management/services/API/auth/model/login_respond.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthRepository _authRepository = AuthRepository();

  void signInUser(LoginRequest loginRequest) async {
    emit(AuthLoading());

    try {
      final _data = await _authRepository.signInWithEmailAndPassword(
        loginRequest: loginRequest,
      );

      _data.fold(
        (l) => emit(AuthError(l)),
        (r) => emit(AuthSuccess(r)),
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
