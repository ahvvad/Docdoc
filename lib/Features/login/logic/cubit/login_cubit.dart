import 'package:docdoc/Core/helpers/constants.dart';
import 'package:docdoc/Core/helpers/shared_pref_helper.dart';
import 'package:docdoc/Core/networking/dio_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:docdoc/Features/login/data/models/login_request_body.dart';
import 'package:docdoc/Features/login/data/repos/login_repo.dart';
import 'package:docdoc/Features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loginLoading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(success: (loginResponse) async {
      await saveUserToken(loginResponse.userData?.token ?? '');
      emit(LoginState.loginSuccess(loginResponse));
    }, failure: (apiErrorModel) {
      emit(LoginState.loginError(apiErrorModel));
    });
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
