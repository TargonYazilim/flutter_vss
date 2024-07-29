import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vss/feature/login/view_model/state/login_state.dart';
import 'package:flutter_vss/product/cache/hive/hive_cache_operation.dart';
import 'package:flutter_vss/product/cache/model/user_cache_model.dart';
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
    required HiveCacheOperation<LoginResponseCacheModel>
        loginResponseCacheOperation,
    required SharedCacheOperation sharedCacheOperation,
  })  : _authenticationOperation = authenticationOperation,
        _loginResponseCacheOperation = loginResponseCacheOperation,
        _sharedCacheOperation = sharedCacheOperation,
        super(LoginState(isLoading: false));

  final AuthenticationOperation _authenticationOperation;
  final HiveCacheOperation<LoginResponseCacheModel>
      _loginResponseCacheOperation;
  final SharedCacheOperation _sharedCacheOperation;

  final GlobalKey<FormState> loginFormKey = GlobalKey();
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;
  Future<bool> login() async {
    if (!(loginFormKey.currentState?.validate() ?? true)) return false;
    if (state.isLoading) return false;

    try {
      emit(state.copyWith(isLoading: true));

      var deviceUniqueId = await DeviceUtility.instance.getUniqueDeviceId();
      var result = await _authenticationOperation.login(
        Login(
          username: usernameController.text,
          password: passwordController.text,
          macaddress: deviceUniqueId,
        ),
      );
      if (result?.model?.error == "1")
        _showError(result?.model?.result);
      else {
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
    print("Login ? = ${loginResponse}");
    if (loginResponse == null) return false;
    _loginResponseCacheOperation
        .add(LoginResponseCacheModel(loginResponse: loginResponse));
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
}
