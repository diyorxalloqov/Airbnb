import 'package:airbnb___/utils/status.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class AuthState extends Equatable {
  final ActionStatus status;
  final String error;

  const AuthState({this.status = ActionStatus.isInitial, this.error = ''});

  AuthState copyWith({ActionStatus? status, String? error}) {
    return AuthState(status: status ?? this.status, error: error ?? this.error);
  }

  @override
  List<Object?> get props => [status, error];
}
