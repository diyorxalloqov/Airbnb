import 'package:airbnb___/modules/auth/service/auth_service.dart';
import 'package:airbnb___/utils/status.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:airbnb___/modules/auth/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService = AuthService();
  AuthCubit() : super(const AuthState()) {
    signInGoogle;
  }

  Future<void> signInGoogle(String token) async {
    emit(state.copyWith(status: ActionStatus.isLoading));
    Either<String, String> response = await _authService.login(token);
    response.fold(
        (l) => emit(state.copyWith(status: ActionStatus.isError, error: l)),
        (r) => emit(state.copyWith(status: ActionStatus.isSuccess)));
  }
}
