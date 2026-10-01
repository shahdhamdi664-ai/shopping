import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/ui/auth/data/models/user_model.dart';
import 'package:shopping_app/features/ui/auth/data/repo/repo_auth.dart';
import 'package:shopping_app/features/ui/auth/manager/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  // AuthCubit() : super(AuthInitialState());
  AuthCubit._internal(): super(AuthInitialState());
  static final AuthCubit _cubitInstance=AuthCubit._internal();
  factory AuthCubit(){
    return _cubitInstance;
  }
  static AuthCubit get(context) => BlocProvider.of(context);

  final TextEditingController userNameController =TextEditingController();
  final TextEditingController emailController =TextEditingController();
  final TextEditingController passwordController =TextEditingController();
  final TextEditingController passwordConfirmController =TextEditingController();
  final TextEditingController phoneController =TextEditingController();

  final TextEditingController loginEmailController =TextEditingController();
  final TextEditingController loginPasswordController =TextEditingController();
  AuthRepo authRepo = AuthRepo();
  void onRegisterPressed() async {
    emit(AuthRegisterLoading());
    var response = await authRepo.register(
      name: userNameController.text,
      phone: phoneController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    response.fold(
          (String error) {
        emit(AuthRegisterError(error: error));
      },
          (r) {
        emit(AuthRegisterSuccess(msg: r));
      },
    );
  }
  void onLoginPressed() async {
    emit(AuthLoginLoading());
    var response = await authRepo.login(
        email: loginEmailController.text,
        password: loginPasswordController.text
    );

    response.fold(
          (String error) {
        emit(AuthLoginError(error: error));
      },
          (r) {
        emit(AuthLoginSuccess());
      },
    );
  }
}