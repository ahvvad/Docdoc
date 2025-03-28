import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  factory LoginState.initial() = _Initial;
  factory LoginState.loading() = Loading;
  factory LoginState.success(T data) = Success<T>;
  const factory LoginState.error({required String error}) = Error;
}
