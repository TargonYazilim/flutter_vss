// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vss/feature/login/view_model/state/login_state.dart';
import 'package:flutter_vss/product/cache/hive/hive_cache_operation.dart';
import 'package:flutter_vss/product/cache/shared/key/shared_keys.dart';
import 'package:flutter_vss/product/cache/shared/shared_cache_operation.dart';
import 'package:flutter_vss/product/service/interface/authentication_operation.dart';
import 'package:flutter_vss/product/service/model/login/login.dart';
import 'package:flutter_vss/product/service/model/login/login_response.dart';
import 'package:flutter_vss/product/state/container/product_state_items.dart';
import 'package:kartal/kartal.dart';

final class LoginViewModel extends Cubit<LoginState> {
  LoginViewModel({
    required AuthenticationOperation authenticationOperation,
    required HiveCacheOperation<LoginResponse> loginResponseCacheOperation,
    required SharedCacheOperation sharedCacheOperation,
  })  : _authenticationOperation = authenticationOperation,
        _loginResponseCacheOperation = loginResponseCacheOperation,
        _sharedCacheOperation = sharedCacheOperation,
        super(const LoginState(isLoading: false));

  /// Auth service operations
  final AuthenticationOperation _authenticationOperation;

  // Login caches from hive
  final HiveCacheOperation<LoginResponse> _loginResponseCacheOperation;

  /// Shared caches
  final SharedCacheOperation _sharedCacheOperation;

  final GlobalKey<FormState> loginFormKey = GlobalKey();
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  Future<bool> login() async {
    if (!(loginFormKey.currentState?.validate() ?? true)) return false;
    if (state.isLoading) return false;
    try {
      emit(state.copyWith(isLoading: true));

      final deviceUniqueId = await DeviceUtility.instance.getUniqueDeviceId();
      final result = await _authenticationOperation.login(
        Login(
          username: usernameController.text,
          password: passwordController.text,
          macaddress: deviceUniqueId,
          companyNo: companyNo,
          periodNo: periodNo,
        ),
      );

    ;
      if (result?.errorModel != null) {
        _showError(result?.errorModel?.errorMessage);
      } else if (result?.model?.error != '0' &&
          result?.model?.error?.trim() != '') {
        _showError(result?.model?.result);
      } else {
        await _saveUserId(result?.model?.id.toString());
        return _saveItems(result?.model);
      }
    } finally {
      emit(state.copyWith(isLoading: false));
    }
    return false;
  }

  /// Save users to hive cache
  bool _saveItems(LoginResponse? loginResponse) {
    if (loginResponse == null) return false;
    _loginResponseCacheOperation.add(loginResponse);
    return true;
  }

  Future<void> _saveUserId(String? id) async {
    if (id == null) return;
    await _sharedCacheOperation.add(SharedKeys.userId, id);
  }

  void _showError(String? message) {
    if (message == null) return;
    ProductStateItems.toastService.showErrorMessage(message: message);
  }

  /// Get companyNo from shared cache for login
  String? get companyNo => _sharedCacheOperation.get(SharedKeys.companyNo);

  /// Get periodNo from shared cache for login
  String? get periodNo => _sharedCacheOperation.get(SharedKeys.periodNo);
}
