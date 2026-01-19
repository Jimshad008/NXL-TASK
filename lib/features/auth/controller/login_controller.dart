
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nxl_task/features/auth/model/login_add_body_model.dart';
import 'package:nxl_task/features/auth/model/user_model.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../app/app_router.dart';
import '../../../app/providers.dart';
import '../../../util/alert.dart';
import '../../../util/navigation_service.dart';
import '../repository/auth_repository.dart';



part 'login_controller.freezed.dart';

part 'login_controller.g.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.idle() = LoginStateIdle;

  const factory LoginState.loading() = LoginStateLoading;

  const factory LoginState.success() = LoginStateSuccess;

  const factory LoginState.error(String error) = LoginStateError;
}

@riverpod
class LoginController extends _$LoginController {
  @override
  LoginState build() => const LoginState.idle();
  Future<void> signUpWithEmailPassword(UserModel user) async {
    try {

      state = const LoginState.loading();

      ///verify id
      final authRepo = ref.read(authRepoProvider);
      final res = await authRepo.signUpWithEmailPassword(user.email,user.password);
      if (res != null) {
        res as User;
        res.updateDisplayName(user.name);

        ///save data to spf




        // ref.read(secureStorageProvider).accessToken = res.accessToken;
        // ref.read(secureStorageProvider).refreshToken = res.refreshToken;
        ref.read(preferenceStorageProvider).loggedIn = true;

        Alert.showToast("Registration Success", isLong: true);
        NavigationService.pushReplacement(page: AppRouter.home);


        state = const LoginState.success();
      }
    } catch (err) {
      state = LoginState.error(err.toString());
      Alert.showToast(err.toString(), isLong: true);
    }
  }
  Future<void> loginWithEmailPassword(LoginAddBodyModel login) async {
    try {
      state = const LoginState.loading();

      ///verify id
      final authRepo = ref.read(authRepoProvider);
      final res = await authRepo.loginWithEmailPassword(login.email,login.password);
      if (res != null) {
        res as User;

        ///save data to spf
        // ref.read(secureStorageProvider).accessToken = res.accessToken;
        // ref.read(secureStorageProvider).refreshToken = res.refreshToken;
        ref.read(preferenceStorageProvider).loggedIn = true;





        Alert.showToast("Login Success", isLong: true);
        NavigationService.pushReplacement(page: AppRouter.home);


        state = const LoginState.success();
      }
    } catch (err) {
      state = LoginState.error(err.toString());
      Alert.showToast(err.toString(), isLong: true);
    }
  }
  Future<void> forgotPassword(String email,) async {
    try {
      state = const LoginState.loading();

      ///verify id
      final authRepo = ref.read(authRepoProvider);
      final res = await authRepo.forgotPassword(email);
      if (res != null) {






        Alert.showToast("Password reset email sent.", isLong: true);


        NavigationService.pushReplacement(page: AppRouter.login);

        state = const LoginState.success();
      }
    } catch (err) {
      state = LoginState.error(err.toString());
      Alert.showToast(err.toString(), isLong: true);
    }
  }
}
